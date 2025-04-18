import folium
import requests

# User Location (Example: Bangalore)
lat, lng = 12.9716, 77.5946  
range_km = 10  

# Fetch nearby EV stations from Flask API
try:
    stations = requests.get(f"http://127.0.0.1:5000/stations?lat={lat}&lng={lng}&range={range_km}").json()
except requests.exceptions.RequestException as e:
    print(f"Error fetching nearby stations: {str(e)}")
    stations = []  # Set to an empty list or handle as needed


# Create Map
m = folium.Map(location=[lat, lng], zoom_start=13)

# Add User Location Marker
folium.Marker([lat, lng], popup="Your Location", icon=folium.Icon(color="blue")).add_to(m)

# Add EV Charging Stations
for station in stations:
    s_lat = station["AddressInfo"]["Latitude"]
    s_lng = station["AddressInfo"]["Longitude"]
    name = station["AddressInfo"]["Title"]
    folium.Marker([s_lat, s_lng], popup=name, icon=folium.Icon(color="green")).add_to(m)

# Start & Destination (Example)
end_lat, end_lng = 13.0359, 77.5970  

# Fetch route data from Flask API
route = requests.get(f"http://127.0.0.1:5000/directions?start_lat={lat}&start_lng={lng}&end_lat={end_lat}&end_lng={end_lng}").json()

# Extract coordinates
route_coords = route["routes"][0]["geometry"]["coordinates"]
route_coords = [(coord[1], coord[0]) for coord in route_coords]  # Reverse (lng, lat) to (lat, lng)

# Draw route on map
folium.PolyLine(route_coords, color="red", weight=5, opacity=0.7).add_to(m)

# Save updated map
m.save("ev_map_with_route.html")
print("Map with route saved as ev_map_with_route.html. Open in browser!")
