from flask import Flask
from flask_cors import CORS  # Importing CORS

# Initialize Flask App
app = Flask(__name__)

# Enable Cross-Origin Resource Sharing (CORS) for the entire app
CORS(app)

# Alternatively, if you want to enable CORS for specific routes:
# cors = CORS(app, resources={r"/api/*": {"origins": "*"}})

@app.route('/')
def hello_world():
    return "Hello shubham!"

if __name__ == '__main__':
    app.run(debug=True)
