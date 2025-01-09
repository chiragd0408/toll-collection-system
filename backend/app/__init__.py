from flask import Flask
from .routes import toll_routes  # Assuming your routes are in a separate module

def create_app():
    # Initialize the Flask app
    app = Flask(__name__)

    # Configure your app (e.g., setting up a secret key, database URI, etc.)
    app.config['SECRET_KEY'] = 'your_secret_key'

    # Register blueprints (if using blueprints for better modularization)
    app.register_blueprint(toll_routes)

    # You can add more app initialization logic here if needed, such as setting up logging or database connections

    return app
