from flask import Blueprint, jsonify, abort, request
from ..models import manufacturer, suv, market, kbb, edmunds, cars_dotcom, sales_region, suv_year, db

bp = Blueprint('cars_dotcom', __name__, url_prefix='/cars_dotcom')
