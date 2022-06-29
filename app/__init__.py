import flask
import jinja2
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from datetime import datetime
import mysql.connector



blueprint = flask.Blueprint('filters', __name__)

@jinja2.contextfilter
@blueprint.app_template_filter()
def datetimeformat(value, format='%H:%M / %d-%m-%Y'):
  date = datetime.fromtimestamp(value)
  return date.utcfromtimestamp(format)

app = Flask(__name__)
app.register_blueprint(blueprint)

app.config['SECRET_KEY'] = '29cecf8afd6176f06bb3f55472d490d1'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
#app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///sistema.db'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:sistemaapurador@localhost/sistema'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://b6d4b17dca4b6b:fa6bba9c@us-cdbr-east-05.cleardb.net/heroku_c7f16e3a08a9c82'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://b2e27851b08bb1:ccf4b5fb@us-cdbr-east-06.cleardb.net/heroku_813be3ee8adffef'

database = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'
login_manager.login_message_category = 'alert-info'


from app import routes
