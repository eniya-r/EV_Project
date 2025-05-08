#check
import random
from datetime import datetime
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from flask import Flask, render_template, url_for, request, redirect, session, jsonify, flash
from DBConnection import Db
from flask_cors import CORS
import requests
import numpy as np
import pandas as pd
from flask import Flask, request, jsonify, render_template, redirect, url_for, session
import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler, OrdinalEncoder
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout
from flask_sqlalchemy import SQLAlchemy
import re

app = Flask(__name__)
app.secret_key="123"
CORS(app)  # Enable CORS for all routes

# Database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///ev_charging_stations.db'  # Change to your database URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Load your data into a DataFrame
ev = pd.read_csv(r'C:\Users\Dell\EV_Project\NewElectricCarData (1).csv') # Adjust the path as necessary

# Define features and encode categorical variables
features = ['TopSpeed_KmH', 'AccelSec', 'Efficiency_WhKm', 'Seats', 'Brand', 'PowerTrain', 'BodyStyle', 'Segment']
encoder = OrdinalEncoder()
X = ev[features].values
X[:, [4, 5, 6, 7]] = encoder.fit_transform(X[:, [4, 5, 6, 7]])  # Encoding categorical features

y = ev['Range_Km'].values
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)  # Scale the numeric features
X_test_scaled = scaler.transform(X_test)  # Scale the test data

# Create the model
model = Sequential([
    Dense(64, activation='relu', input_shape=(len(features),)),
    Dropout(0.2),
    Dense(32, activation='relu'),
    Dropout(0.2),
    Dense(16, activation='relu'),
    Dense(1)
])
model.compile(optimizer='adam', loss='mse', metrics=['mae'])
model.fit(X_train_scaled, y_train, validation_split=0.2, epochs=100, batch_size=32, verbose=1)

@app.route('/')
def home():
    return render_template('index.html')


@app.route('/find_your_charger')
def find_your_charger():
    return render_template('find_your_charger.html')

@app.route('/about')
def about():
    return render_template('about.html')
@app.route('/map')
def map_page():
    return render_template('user/map.html') 



@app.route('/contact_us', methods=['GET', 'POST'])
def contact_us():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        feedback = request.form['message']
        db = Db()
        sql = db.insert("INSERT INTO contact_us (Name, Email, feedback_date, feedback) VALUES (%s, %s, NOW(), %s)", (name, email, feedback))
        return render_template('contact_us.html', message='Thank you for your feedback!')
    else:
        return render_template('contact_us.html')






@app.route('/forgot-password', methods=['GET', 'POST'])
def forgot_password():
    print("Forgot Password route accessed")  # Debugging line
    if request.method == "POST":
        # Validate email input
        email = request.form.get('email', '').strip()
        if not email:
            return "Email is required", 400
        if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
            return "Invalid email format", 400

        # Check if email exists in database
        db = Db()
        user = db.selectOne("SELECT * FROM login WHERE email=%s", (email,))
        if not user:
            return "Sorry, we couldn't find an account associated with that email address.", 400

         # Send email with passw    ord reset instructions or link
        password = user['password']
        sender_email = "a97298570@gmail.com"
        sender_password = "56B50C32C322385ED3009518610638823005"
        recipient_email = email
        subject = "Password Reset for EV STATION BOOKING WEBSITE"
        content = "Your password for EV STATION BOOKING WEBSITE has been reset. Please login with your new password."
        host = "smtp.gmail.com"
        port = 465
        message = MIMEMultipart()
        message['From'] = Header(sender_email)
        message['To'] = Header(recipient_email)
        message['Subject'] = Header(subject)
        message.attach(MIMEText(content, 'plain', 'utf-8'))
        try:
            with smtplib.SMTP_SSL(host, port) as server:            
                server.login("a97298570@gmail.com", "56B50C32C322385ED3009518610638823005")
                server.sendmail("a97298570@gmail.com", recipient_email, message.as_string())

                return "An email has been sent to your email address with instructions on how to reset your password."
        except smtplib.SMTPAuthenticationError:
            return "Failed to authenticate with the email server. Please check your email credentials.", 500
        except smtplib.SMTPException as e:
            return f"An error occurred while sending the email: {str(e)}", 500

    return render_template("forgot-password.html")



@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == "POST":
        username = request.form['username']
        password = request.form['password']
        db = Db()
        user = db.selectOne("SELECT * FROM login WHERE username=%s AND password=%s", (username, password))
        
        if user:
            session['username'] = username
            session['user_type'] = user['usertype']
            session['uid'] = user['login_id']
            
            if user['usertype'] == 'admin':
                return redirect('/admin-home')  # Redirect to admin dashboard
            else:
                return redirect('/user-dashboard')  # Redirect to user dashboard for regular users
        else:
            return '''<script>alert('User not found');window.location="/login"</script>'''
    return render_template("login.html")


@app.route('/logout')
def logout():
    session.pop('username',None)
    session.pop('user_type',None)
    session.pop('log',None)
    session.pop('usertype',None)

    return redirect('/login')



    # =========================

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == "POST":
        username = request.form['signupUsername']
        email = request.form['email']
        password = request.form['password']
        confirmPassword = request.form['confirmPassword']

        # Perform form validation
        if username.strip() == '':
            return redirect(url_for('register', error='Please enter a username', form_id='createAccount'))

        if email.strip() == '':
            return redirect(url_for('register', error='Please enter an email address', form_id='createAccount'))

        if password.strip() == '':
            return redirect(url_for('register', error='Please enter a password', form_id='createAccount'))

        if confirmPassword.strip() == '':
            return redirect(url_for('register', error='Please confirm the password', form_id='createAccount'))

        if password != confirmPassword:
            return redirect(url_for('register', error='Passwords do not match', form_id='createAccount'))

        db = Db()
        qry = db.insert("INSERT INTO login (username,  password, usertype) VALUES (%s, %s, 'user')", (username,  password))

        return '<script>alert("User registered"); window.location.href="/login";</script>'
    else:
        error = request.args.get('error')  # Get the error message from the URL parameters
        return render_template("login.html", error=error , form_id='createAccount')






#////////////////////////////////////////////////////////////ADMIN///////////////////////////////////////////////////////////////////////////////////////////////////////////////////



@app.route('/admin-home')
def admin_home():
    print('session ', session)
    if session['user_type'] == 'admin':
        username = session['username']  # get the username from the session
        return render_template('admin/admin-login-dashboard.html', username=username)
    else:
        return redirect('/')



@app.route('/Manage_station')
def Manage_station():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        qry=db.select("select station_id, station_name, address, city, charger_type, available_ports, status from admin_charging_station_list")
        return render_template("admin/Manage_station.html",data=qry)
    else:
        return redirect('/')

# =============================contact_us
@app.route('/view_feedback')
def view_feedback():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        ss=db.select("select * from contact_us")
        return render_template("admin/view_feedback.html",data=ss)
    else:
        return redirect('/')

# 


# ==================delete station=======
@app.route("/adm_delete_station/<station_name>")
def adm_delete_station(station_name):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("DELETE FROM admin_charging_station_list WHERE Station_name = %s", (station_name,))
        return '''<script>alert('station deleted');window.location="/Manage_station"</script>'''
    else:
        return redirect('/')
# =======================================





@app.route("/adm_delete_feedback/<feedback>")
def adm_delete_feedback(feedback):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from contact_us where Sl_no='"+feedback+"'")
        return '''<script>alert('feedback deleted');window.location="/view_feedback"</script>'''
    else:
        return redirect('/')



@app.route('/user-list')
def user_list():
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.select("SELECT * FROM user")
        print('User list:', qry)  # Debugging statement to check the output
        return render_template("admin/user-list.html", data=qry)
    else:
        return redirect('/')


# ==================delete user===========
@app.route("/adm_delete_user/<user_id>")
def adm_delete_user(user_id):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from user where user_id='"+user_id+"'")
        return '''<script>alert('user deleted');window.location="/user-list"</script>'''
    else:
        return redirect('/')
# ==============view booking=========================

@app.route('/view_booking')
def view_booking():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        bookings = db.select("select Booking_id	, Booking_date, Time_from, Time_to, City, Station_name, Available_ports, login_id  from booking  order by Booking_date desc;")
        return render_template('admin/view_booking.html', bookings=bookings)
    else:
        return redirect('/')

# ===========delete booking

@app.route("/adm_delete_booking/<Booking_id>")
def adm_delete_booking(Booking_id):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from booking where Booking_id='"+Booking_id+"'")
        return '''<script>alert('booking deleted');window.location="/view_booking"</script>'''
    else:
        return redirect('/')



#//////////////////////////////////////////////////////////////USER//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# -----------

@app.route('/user-dashboard')
def user_dashboard():
    if 'user_type' in session and session['user_type'] == "user":
        username = session['username']  # get the username from the session
        if 'uid' in session:  # Check if 'uid' exists
            db = Db()
            bookings = db.select("SELECT * FROM booking WHERE login_id = %s ORDER BY Booking_date DESC;", (session['uid'],))
            return render_template("user/user-login-dashboard.html", bookings=bookings, username=username)
        else:
            return redirect('/')  # Redirect if uid is not set
    else:
        return redirect('/')


@app.route('/usr_delete_booking/<int:booking_id>')
def usr_delete_booking(booking_id):
    if 'user_type' in session and session['user_type'] == "user":
        db = Db()
        
        # Delete the booking for the specific user and booking_id
        db.delete("DELETE FROM booking WHERE booking_id = %s AND login_id = %s", (booking_id, session['uid']))
        
        return '''<script>alert('Booking deleted');window.location="/user-dashboard"</script>'''
    else:
        return redirect('/user-dashboard')



# TODO: Fix the DB (FK, table etc) and frontend field and backend Field

@app.route('/user-profile', methods=['GET', 'POST'])
def user_profile():
    if request.method == 'POST':
        # Handle form submission for updating user profile
        # Your code here
        pass
    return render_template('user/user-profile.html')




@app.route('/user_find_your_charger', methods=['GET', 'POST'])
def user_find_your_charger():
    if 'user_type' in session and session['user_type'] == 'user':
        if request.method == 'POST':
            city = request.form.get('City')
            charger_type = request.form.get('Charger_type')
            print(f"User Find Your Charger Called")  # Log statement to indicate function call
            print(f"City: {city}, Charger Type: {charger_type}")  # Log the values received from the form
            
            db = Db()
            qry = db.select("SELECT station_name, address, charger_type, no_of_ports FROM admin_charging_station_list WHERE city = %s AND charger_type = %s", (city, charger_type))
            print(f"Query Result: {qry}")  # Log the query result
            
            if qry:  # Check if the query returned any results
                return render_template('user/station_search.html', data=qry, City=city, Charger_type=charger_type)
            else:
                print("No results found for the query.")  # Log statement for no results
                return render_template('user/station_search.html', data=[], City=city, Charger_type=charger_type)  # No results found
        return render_template('user/user_find_your_charger.html')  # Render the form page
    else:
        print("User not logged in or not a user type.")  # Log statement for unauthorized access
        return redirect('/')




@app.route('/search_stations', methods=['POST'])
def search_stations():
    # Get the form data
    City = request.form.get('City')
    Charger_type = request.form.get('Charger_type')

    # Redirect to the station_list page with the city and charger_type as URL parameters
    return redirect(url_for('station_search', City=City, Charger_type=Charger_type))


@app.route('/station_search', methods=['GET'])
def station_search():
    if 'user_type' in session and session['user_type'] == 'user':
        city = request.args.get('City')
        charger_type = request.args.get('Charger_type')
        print(f"Station Search Called")  # Log statement to indicate function call
        print(f"City: {city}, Charger Type: {charger_type}")  # Log the values received from the query
        
        db = Db()
        qry = db.select("SELECT station_name, address, charger_type, no_of_ports FROM admin_charging_station_list WHERE city = %s AND charger_type = %s", (city, charger_type))
        print(f"Query Result: {qry}")  # Log the query result
        
        if qry:  # Check if the query returned any results
            return render_template('user/station_search.html', data=qry, City=city, Charger_type=charger_type)
        else:
            print("No results found for the query.")  # Log statement for no results
            return render_template('user/station_search.html', data=[], City=city, Charger_type=charger_type)  # No results found
    else:
        print("User not logged in or not a user type.")  # Log statement for unauthorized access
        return redirect('/')

# ==============from station_search to booking page====================
@app.route('/booking', methods=['GET', 'POST'])
def booking():
    if request.method == 'POST':
        Station_name = request.form['Station_name']
        City = request.form['City']
        Available_ports = request.form['Available_ports']
        return redirect(url_for('booking_form',  Station_name=Station_name, City=City, Available_ports=Available_ports))
    else:
        # handle GET request to display the form
        Station_name = request.args.get('Station_name')
        City = request.args.get('City')
        Available_ports = request.args.get('Available_ports')
        return redirect(url_for('booking_form', Station_name=Station_name, City=City, Available_ports=Available_ports))

@app.route('/booking-form', methods=['GET'])
def booking_form():
    city = request.args.get('City')
    available_ports = request.args.get('Available_ports')
    station_name = request.args.get('Station_name')
    db = Db()
    station_data = db.select("select * from admin_charging_station_list where Station_name = %s", (station_name,))
    session['station_data'] = station_data[0] if station_data else None
    if 'station_data' in session and session['station_data']:
        return render_template('/user/booking_form.html', city=city, available_ports=available_ports)
    else:
        return redirect(url_for('station_search'))



# ====================from booking to dashboard

@app.route('/book', methods=['POST'])
def book():
    if 'user_type' in session and session['user_type'] == 'user':
        # get the form data submitted by the user
        station_name = request.form['Station_name']
        city = request.form['City']
        available_ports = request.form['Available_ports']
        booking_date = request.form['Booking_date']
        time_from = request.form['Time_from']
        time_to = request.form['Time_to']
        login_id = session['uid']


        db = Db()

        # get the current timestamp
        created_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        # insert the booking data into the MySQL table
        sql = "insert into booking (Station_name, City, Available_ports, Booking_date, Time_from, Time_to, Created_id, login_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        booking_id = db.insert(sql, (station_name, city, available_ports, booking_date, time_from, time_to, created_at, login_id))

        # redirect the user to their dashboard
        return render_template("user/user-login-dashboard.html", data={
            'Station_name': station_name,
            'City': city,
            'Available_ports': available_ports,
            'Booking_date': booking_date,
            'Time_from': time_from,
            'Time_to': time_to,
            'Created_id': created_at,
            'Booking_id': booking_id
        })
    else:
        return redirect('/booking-form')


OPENCHARGEMAP_API_KEY = "b8f317c7-3dbb-4a92-bb7c-995c95a0e058" 

@app.route('/nearby-stations')
def nearby_stations():
    return render_template('user/map.html')


@app.route('/find_nearby_station')
def find_nearby_station():
    return render_template('find_nearby_station.html')

@app.route('/stations', methods=['GET'])
def get_stations():
    try:
        lat = request.args.get('lat')
        lng = request.args.get('lng')
        range_km = request.args.get('range', 100)  # Default range is 20 km

        # Validate latitude and longitude
        if lat is None or lng is None:
            return jsonify({'error': 'Latitude and longitude are required.'}), 400

        url = f"https://api.openchargemap.io/v3/poi/?output=json&latitude={lat}&longitude={lng}&maxresults=10&distance={range_km}&key=b8f317c7-3dbb-4a92-bb7c-995c95a0e058"
        response = requests.get(url)
        response.raise_for_status()
        stations = response.json()
        
        return jsonify(stations)
    except requests.exceptions.RequestException as e:
        return jsonify({'error': str(e)}), 500
    except Exception as e:
        return jsonify({'error': 'An error occurred while fetching stations.'}), 500

@app.route('/directions', methods=['GET'])
def get_directions():
    try:
        start_lat = request.args.get('start_lat')
        start_lng = request.args.get('start_lng')
        end_lat = request.args.get('end_lat')
        end_lng = request.args.get('end_lng')

        # Validate input parameters
        if not all([start_lat, start_lng, end_lat, end_lng]):
            return jsonify({'error': 'Start and end coordinates are required.'}), 400

        url = f"https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248a01d6e78f9a549b1adfc9c00dc29a048&start={start_lng},{start_lat}&end={end_lng},{end_lat}"
        response = requests.get(url)
        response.raise_for_status()  # Raise an error for bad responses
        route = response.json()

        return jsonify(route)
    except requests.exceptions.RequestException as e:
        return jsonify({'error': str(e)}), 500
    except Exception as e:
        return jsonify({'error': 'An error occurred while fetching directions.'}), 500

@app.route('/options', methods=['GET'])
def options():
    brands = ev['Brand'].unique().tolist()
    power_trains = ev['PowerTrain'].unique().tolist()
    body_styles = ev['BodyStyle'].unique().tolist()
    segments = ev['Segment'].unique().tolist()
    return jsonify({'brands': brands, 'powerTrains': power_trains, 'bodyStyles': body_styles, 'segments': segments})

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.json
        print(data)  # Log the incoming data
        new_data = np.array([[data['topSpeed'], data['acceleration'], data['efficiency'], data['seats'], 
                              data['brand'], data['powerTrain'], data['bodyStyle'], data['segment']]])
        
        # Ensure the categorical data is encoded correctly
        new_data[:, [4, 5, 6, 7]] = encoder.transform(new_data[:, [4, 5, 6, 7]])
        
        new_data_scaled = scaler.transform(new_data)
        
        predicted_range = float(model.predict(new_data_scaled)[0][0])
        remaining_range = float((predicted_range * data['soc']) / 100.0)
        
        print(f"Predicted Range: {predicted_range}, Remaining Range: {remaining_range}")  # Log the predicted values
        return jsonify({'predictedRange': predicted_range, 'remainingRange': remaining_range})
    
    except Exception as e:
        print(f"Error: {str(e)}")  # Log the error
        return jsonify({'error': str(e)}), 500  # Return the error message as JSON

@app.route('/prediction', methods=['GET'])
def prediction_page():
    print("Prediction page accessed")  # Debugging line
    return render_template('user/prediction.html')

@app.route('/create-account', methods=['GET', 'POST'])
def create_account():
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')  # Capture email but do not store it in the login table
        password = request.form.get('password')
        confirm_password = request.form.get('confirm-password')

        # Perform form validation
        if not username or not password or not confirm_password:
            return "All fields are required", 400

        if password != confirm_password:
            return "Passwords do not match", 400

        db = Db()
        try:
            # Insert only username and password into the login table
            db.insert("INSERT INTO login (username, password, usertype) VALUES (%s, %s, 'user')", (username, password))
            # Optionally, you can store the email in a separate table if needed
            # db.insert("INSERT INTO user_emails (username, email) VALUES (%s, %s)", (username, email))
            return redirect(url_for('login'))  # Redirect after successful account creation
        except Exception as e:
            return f"An error occurred: {str(e)}", 500  # Return the error message for debugging

    return render_template('create-account.html')

if __name__ == '__main__':        
    app.run(host='127.0.0.1', port=5000, debug=True)
