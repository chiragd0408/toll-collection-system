from flask import Flask, request, jsonify
import json

app = Flask(__name__)

# Example: Mock database for toll collection points
toll_points = {
    'toll_1': {'location': {'lat': 12.9716, 'long': 77.5946}, 'rate': 50},  # Example GPS coordinates (Bangalore)
    'toll_2': {'location': {'lat': 13.0827, 'long': 80.2707}, 'rate': 75}   # Example coordinates (Chennai)
}

@app.route('/')
def home():
    return "Welcome to the GPS-based Toll Collection System!"

@app.route('/calculate_toll', methods=['POST'])
def calculate_toll():
    data = request.get_json()
    vehicle_location = data.get('vehicle_location')  # GPS location of the vehicle
    toll_road_id = data.get('toll_road_id')  # Example: 'toll_1', 'toll_2'
    if toll_road_id not in toll_points:
        return jsonify({'error': 'Invalid toll road ID'}), 400
    
    toll_info = toll_points[toll_road_id]
    toll_rate = toll_info['rate']

    # Calculate toll here based on distance or logic as needed
    # For now, just return the rate
    return jsonify({
        'toll_road_id': toll_road_id,
        'location': toll_info['location'],
        'toll_rate': toll_rate
    })

@app.route('/add_toll', methods=['POST'])
def add_toll():
    data = request.get_json()
    toll_road_id = data.get('toll_road_id')
    location = data.get('location')
    rate = data.get('rate')

    # Validate input
    if not toll_road_id or not location or not rate:
        return jsonify({'error': 'Missing required data'}), 400

    toll_points[toll_road_id] = {'location': location, 'rate': rate}
    return jsonify({'message': 'Toll point added successfully', 'toll_points': toll_points})


if __name__ == '__main__':
    app.run(debug=True)
