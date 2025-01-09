from flask import current_app
from flask_sqlalchemy import SQLAlchemy

# Initialize SQLAlchemy
db = SQLAlchemy()

class TollPoint(db.Model):
    __tablename__ = 'toll_points'
    
    # Define columns for the toll point data
    toll_road_id = db.Column(db.String(50), primary_key=True)  # Unique identifier for the toll road
    location = db.Column(db.String(100))  # GPS location as a string (latitude, longitude)
    rate = db.Column(db.Float)  # Toll rate for the given toll point

    def __init__(self, toll_road_id, location, rate):
        self.toll_road_id = toll_road_id
        self.location = location
        self.rate = rate

    def __repr__(self):
        return f'<TollPoint {self.toll_road_id}>'

    @classmethod
    def get_toll_by_road_id(cls, toll_road_id):
        """Query the toll point by toll road ID."""
        return cls.query.filter_by(toll_road_id=toll_road_id).first()

    @classmethod
    def add_toll_point(cls, toll_road_id, location, rate):
        """Add a new toll point to the database."""
        toll_point = cls(toll_road_id=toll_road_id, location=location, rate=rate)
        db.session.add(toll_point)
        db.session.commit()

    @classmethod
    def get_all_toll_points(cls):
        """Retrieve all toll points."""
        return cls.query.all()
