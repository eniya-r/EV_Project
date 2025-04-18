import streamlit as st
import numpy as np
import pandas as pd
from sklearn.preprocessing import OrdinalEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout
from sklearn.metrics import mean_squared_error, r2_score
import matplotlib.pyplot as plt

# Load the dataset
ev = pd.read_csv(r'C:\Users\Dell\EV_Project\NewElectricCarData (1).csv')

# Streamlit UI for Battery Range Prediction
st.title("Electric Vehicle Battery Range Prediction")

# Input fields for user data
top_speed = st.number_input("Top Speed (Km/h)", min_value=0, value=0)
acceleration = st.number_input("Acceleration (Sec)", min_value=0.0, value=0.0)
efficiency = st.number_input("Efficiency (Wh/km)", min_value=0.0, value=0.0)
seats = st.number_input("Number of Seats", min_value=1, value=1)
brand = st.selectbox("Brand", options=ev['Brand'].unique())
power_train = st.selectbox("Power Train", options=ev['PowerTrain'].unique())
body_style = st.selectbox("Body Style", options=ev['BodyStyle'].unique())
segment = st.selectbox("Segment", options=ev['Segment'].unique())
soc_percentage = st.number_input("State of Charge (%)", min_value=0, max_value=100, value=0)

# Load and prepare the model
features = ['TopSpeed_KmH', 'AccelSec', 'Efficiency_WhKm', 'Seats', 'Brand', 'PowerTrain', 'BodyStyle', 'Segment']
encoder = OrdinalEncoder()
X = ev[features].values
X[:, [4, 5, 6, 7]] = encoder.fit_transform(X[:, [4, 5, 6, 7]])  # Encoding categorical features

y = ev['Range_Km'].values

# Split the data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Scale the features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)  # Scale the numeric features
X_test_scaled = scaler.transform(X_test)  # Scale the test data

# Create the deep learning model
model = Sequential([
    Dense(64, activation='relu', input_shape=(len(features),)),
    Dropout(0.2),
    Dense(32, activation='relu'),
    Dropout(0.2),
    Dense(16, activation='relu'),
    Dense(1)
])

# Compile the model
model.compile(optimizer='adam', loss='mse', metrics=['mae'])

# Train the model
model.fit(X_train_scaled, y_train, validation_split=0.2, epochs=100, batch_size=32, verbose=1)

if 'logged_in' in st.session_state and st.session_state['logged_in']:
    if st.button("Predict Battery Range"):
        new_data = np.array([[top_speed, acceleration, efficiency, seats, brand, power_train, body_style, segment]])
        new_data[:, [4, 5, 6, 7]] = encoder.transform(new_data[:, [4, 5, 6, 7]])  # Encoding categorical features
        new_data_scaled = scaler.transform(new_data)  
        
        predicted_range = model.predict(new_data_scaled)
        remaining_range = (predicted_range[0][0] * soc_percentage) / 100.0
        
        st.success(f"Predicted Battery Range: {predicted_range[0][0]:.2f} km")
        st.success(f"Remaining Battery Range at {soc_percentage}% SoC: {remaining_range:.2f} km")

# Optional: Add a section to visualize training history or model performance
if st.checkbox("Show Model Performance Metrics"):
    y_pred = model.predict(X_test_scaled)
    mse = mean_squared_error(y_test, y_pred)
    r2 = r2_score(y_test, y_pred)
    
    st.write(f'Mean Squared Error: {mse:.2f}')
    st.write(f'R-squared Score: {r2:.2f}')
    
    # Visualize predictions
    plt.figure(figsize=(10, 5))
    plt.scatter(y_test, y_pred)
    plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 'r--', lw=2)
    plt.xlabel('Actual Range (km)')
    plt.ylabel('Predicted Range (km)')
    plt.title('Actual vs Predicted Range')
    st.pyplot(plt)
