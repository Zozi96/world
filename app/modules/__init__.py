from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base
from flask_marshmallow import Marshmallow

db = SQLAlchemy()
ma = Marshmallow()

def create_app(config: object) -> Flask:
    app = Flask(__name__)
    app.config.from_object(config)
    with app.app_context():
        db.init_app(app)
        ma.init_app(app)
        automap_base().prepare(db.engine, reflect=True)
        return app
