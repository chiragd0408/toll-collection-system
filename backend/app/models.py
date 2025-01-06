from flask_sqlalchemy import SQLAlchemy 
db = SQLAlchemy() 
 
class User(db.Model): 
    id = db.Column(db.Integer, primary_key=True) 
    username = db.Column(db.String(80), unique=True, nullable=False) 
    email = db.Column(db.String(120), unique=True, nullable=False) 
    password = db.Column(db.String(120), nullable=False) 
 
class TollTransaction(db.Model): 
    id = db.Column(db.Integer, primary_key=True) 
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False) 
    toll_amount = db.Column(db.Float, nullable=False) 
    timestamp = db.Column(db.DateTime, nullable=False) 
