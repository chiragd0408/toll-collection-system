@echo off

REM Create the main project directory
mkdir toll-collection-system

REM Navigate to the project directory
cd toll-collection-system

REM Create the backend directory and its subdirectories
mkdir backend\app\routes
mkdir backend\app\services
mkdir backend\app\utils
mkdir backend\migrations
mkdir backend\tests

REM Create the frontend directory and its subdirectories
mkdir frontend\src\components
mkdir frontend\src\context
mkdir frontend\src\services
mkdir frontend\public

REM Create the chatbot directory and its subdirectories
mkdir chatbot\bot

REM Create the scripts directory
mkdir scripts

REM Create the config directory
mkdir config

REM Create the data directory
mkdir data\logs
mkdir data\reports
mkdir data\user_uploads

REM Create the tests directory
mkdir tests\test_backend
mkdir tests\test_frontend
mkdir tests\test_chatbot

REM Create the Dockerfile for backend and chatbot
type nul > backend\Dockerfile
type nul > chatbot\Dockerfile

REM Create a .gitignore file
type nul > .gitignore

REM Create the README.md file
type nul > README.md

REM Create backend init.py file to initialize the app
echo from flask import Flask > backend\app\__init__.py
echo from .config import Config >> backend\app\__init__.py
echo from .models import db >> backend\app\__init__.py
echo. >> backend\app\__init__.py
echo def create_app(): >> backend\app\__init__.py
echo. >> backend\app\__init__.py
echo     app = Flask(__name__) >> backend\app\__init__.py
echo     app.config.from_object(Config) >> backend\app\__init__.py
echo. >> backend\app\__init__.py
echo     db.init_app(app) >> backend\app\__init__.py
echo. >> backend\app\__init__.py
echo     # Register blueprints (routes) >> backend\app\__init__.py
echo     from .routes.toll_routes import toll_bp >> backend\app\__init__.py
echo     from .routes.user_routes import user_bp >> backend\app\__init__.py
echo     from .routes.payment_routes import payment_bp >> backend\app\__init__.py
echo. >> backend\app\__init__.py
echo     app.register_blueprint(toll_bp, url_prefix='/toll') >> backend\app\__init__.py
echo     app.register_blueprint(user_bp, url_prefix='/user') >> backend\app\__init__.py
echo     app.register_blueprint(payment_bp, url_prefix='/payment') >> backend\app\__init__.py
echo. >> backend\app\__init__.py
echo     return app >> backend\app\__init__.py

REM Create a backend config.py with MySQL settings
echo import os > backend\app\config.py
echo. >> backend\app\config.py
echo class Config: >> backend\app\config.py
echo     SECRET_KEY = os.getenv('SECRET_KEY', 'your_default_secret_key') >> backend\app\config.py
echo     SQLALCHEMY_TRACK_MODIFICATIONS = False >> backend\app\config.py
echo     SQLALCHEMY_ECHO = False  ^# Set to True to log SQL queries >> backend\app\config.py
echo. >> backend\app\config.py
echo     MYSQL_USER = os.getenv('MYSQL_USER', 'your_username') >> backend\app\config.py
echo     MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD', 'your_password') >> backend\app\config.py
echo     MYSQL_HOST = os.getenv('MYSQL_HOST', 'localhost') >> backend\app\config.py
echo     MYSQL_DB = os.getenv('MYSQL_DB', 'toll_system_db') >> backend\app\config.py
echo. >> backend\app\config.py
echo     SQLALCHEMY_DATABASE_URI = "mysql+pymysql://%MYSQL_USER%:%MYSQL_PASSWORD%@%MYSQL_HOST%/%MYSQL_DB%" >> backend\app\config.py
echo. >> backend\app\config.py
echo     ANPR_API_KEY = os.getenv('ANPR_API_KEY', 'your_anpr_api_key') >> backend\app\config.py
echo     PAYMENT_GATEWAY_API_KEY = os.getenv('PAYMENT_GATEWAY_API_KEY', 'your_payment_gateway_api_key') >> backend\app\config.py

REM Create a basic models.py file for backend
echo from flask_sqlalchemy import SQLAlchemy > backend\app\models.py
echo db = SQLAlchemy() >> backend\app\models.py
echo. >> backend\app\models.py
echo class User(db.Model): >> backend\app\models.py
echo     id = db.Column(db.Integer, primary_key=True) >> backend\app\models.py
echo     username = db.Column(db.String(80), unique=True, nullable=False) >> backend\app\models.py
echo     email = db.Column(db.String(120), unique=True, nullable=False) >> backend\app\models.py
echo     password = db.Column(db.String(120), nullable=False) >> backend\app\models.py
echo. >> backend\app\models.py
echo class TollTransaction(db.Model): >> backend\app\models.py
echo     id = db.Column(db.Integer, primary_key=True) >> backend\app\models.py
echo     user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False) >> backend\app\models.py
echo     toll_amount = db.Column(db.Float, nullable=False) >> backend\app\models.py
echo     timestamp = db.Column(db.DateTime, nullable=False) >> backend\app\models.py

REM Create a sample toll_routes.bat file in backend routes folder
echo from flask import Blueprint, request, jsonify > backend\app\routes\toll_routes.py
echo from backend.app.models import db, TollTransaction > backend\app\routes\toll_routes.py
echo from datetime import datetime > backend\app\routes\toll_routes.py
echo. >> backend\app\routes\toll_routes.py
echo toll_bp = Blueprint('toll', __name__) >> backend\app\routes\toll_routes.py
echo. >> backend\app\routes\toll_routes.py
echo @toll_bp.route('/process_toll', methods=['POST']) >> backend\app\routes\toll_routes.py
echo def process_toll(): >> backend\app\routes\toll_routes.py
echo     user_id = request.json.get('user_id') >> backend\app\routes\toll_routes.py
echo     toll_amount = request.json.get('toll_amount') >> backend\app\routes\toll_routes.py
echo. >> backend\app\routes\toll_routes.py
echo     transaction = TollTransaction( >> backend\app\routes\toll_routes.py
echo         user_id=user_id, >> backend\app\routes\toll_routes.py
echo         toll_amount=toll_amount, >> backend\app\routes\toll_routes.py
echo         timestamp=datetime.utcnow() >> backend\app\routes\toll_routes.py
echo     ) >> backend\app\routes\toll_routes.py
echo. >> backend\app\routes\toll_routes.py
echo     db.session.add(transaction) >> backend\app\routes\toll_routes.py
echo     db.session.commit() >> backend\app\routes\toll_routes.py
echo. >> backend\app\routes\toll_routes.py
echo     return jsonify({'message': 'Toll processed successfully', 'transaction_id': transaction.id}), 201 >> backend\app\routes\toll_routes.py

REM Create frontend setup files (index.html, App.js, etc.)
type nul > frontend\public\index.html
type nul > frontend\src\App.js
type nul > frontend\src\services\apiService.js
type nul > frontend\src\components\Dashboard.js
type nul > frontend\src\components\Header.js

REM Create a basic .gitignore file
echo # Python > .gitignore
echo *.pyc >> .gitignore
echo __pycache__/ >> .gitignore
echo # Flask/Django settings >> .gitignore
echo instance/ >> .gitignore
echo .env >> .gitignore
echo # Node.js >> .gitignore
echo node_modules/ >> .gitignore
echo build/ >> .gitignore
echo # Docker >> .gitignore
echo *.dockerfile >> .gitignore

REM Create basic README.md file
echo # Toll Collection System > README.md
echo. >> README.md
echo This project implements a GPS-based toll collection system with backend APIs, frontend, and chatbot integration. >> README.md
echo. >> README.md
echo ## Backend >> README.md
echo The backend is built with Flask and MySQL. It includes routes for toll processing, user management, and payment gateway integration. >> README.md
echo. >> README.md
echo ## Frontend >> README.md
echo The frontend is built with React and communicates with the backend API to display toll information and handle payments. >> README.md
echo. >> README.md
echo ## Chatbot >> README.md
echo The chatbot integration is based on OpenAI's GPT API for providing user assistance. >> README.md
echo. >> README.md
echo ## Setup >> README.md
echo 1. Clone the repository >> README.md
echo 2. Set up a virtual environment >> README.md
echo 3. Install dependencies using `pip install -r requirements.txt` >> README.md
echo 4. Configure the `.env` file with your API keys and MySQL credentials >> README.md
echo. >> README.md
echo ## Docker >> README.md
echo Dockerfiles are included for both the backend and chatbot services. >> README.md

REM Done
echo Project setup complete!
pause
