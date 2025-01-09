import os

class Config:
    # Base configuration class
    SECRET_KEY = 'your_secret_key'
    DEBUG = True

    # Configure database URI (for SQLite)
    SQLALCHEMY_DATABASE_URI = 'sqlite:///toll_collection.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False  # Disable the modification tracking


    # Add any other configurations, such as database or logging configurations
    # DATABASE_URI = 'sqlite:///yourdatabase.db'
    # LOGGING_LEVEL = 'DEBUG'

class ProductionConfig(Config):
    # Production settings (e.g., for deployment)
    DEBUG = False
    SECRET_KEY = os.environ.get('SECRET_KEY', 'your_production_secret_key')

class DevelopmentConfig(Config):
    # Development-specific settings
    DEBUG = True
    SECRET_KEY = 'your_development_secret_key'

