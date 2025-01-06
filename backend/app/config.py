import os 
 
class Config: 
    SECRET_KEY = os.getenv('SECRET_KEY', 'your_default_secret_key') 
    SQLALCHEMY_TRACK_MODIFICATIONS = False 
    SQLALCHEMY_ECHO = False  # Set to True to log SQL queries 
 
    MYSQL_USER = os.getenv('MYSQL_USER', 'your_username') 
    MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD', 'your_password') 
    MYSQL_HOST = os.getenv('MYSQL_HOST', 'localhost') 
    MYSQL_DB = os.getenv('MYSQL_DB', 'toll_system_db') 
 
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://:@/" 
 
    ANPR_API_KEY = os.getenv('ANPR_API_KEY', 'your_anpr_api_key') 
    PAYMENT_GATEWAY_API_KEY = os.getenv('PAYMENT_GATEWAY_API_KEY', 'your_payment_gateway_api_key') 
