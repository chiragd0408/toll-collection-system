from flask import Flask 
from .config import Config 
from .models import db 
 
def create_app(): 
 
    app = Flask(__name__) 
    app.config.from_object(Config) 
 
    db.init_app(app) 
 
    # Register blueprints (routes) 
    from .routes.toll_routes import toll_bp 
    from .routes.user_routes import user_bp 
    from .routes.payment_routes import payment_bp 
 
    app.register_blueprint(toll_bp, url_prefix='/toll') 
    app.register_blueprint(user_bp, url_prefix='/user') 
    app.register_blueprint(payment_bp, url_prefix='/payment') 
 
    return app 
