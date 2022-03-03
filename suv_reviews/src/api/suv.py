from flask import Blueprint, jsonify, abort, request
from ..models import suv, manufacturer, db

bp = Blueprint('suv', __name__, url_prefix='/suv')

# Returns all SUVs


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    suvs = suv.query.all()  # ORM performs SELECT query
    result = []
    for s in suvs:
        result.append(s.serialize())  # build list of tweets as dictionaries
    return jsonify(result)  # return JSON response

# Returns one SUV


@bp.route('/<int:id>', methods=['GET'])
def get_suv(id: int):
    s = suv.query.get_or_404(id)
    return jsonify(s.serialize())

# Adds one new SUV record


@bp.route('', methods=['POST'])
def add_suv():
    # check for required content
    if 'model' not in request.json or 'start_year' not in request.json or 'end_year' not in request.json or 'manufacturer_id' not in request.json:
        return abort(400)
    # the manufacturer_id must exist
    # Manufacturer.query.get_or_404(request.json['manufacturer_id'])

    # construct SUV object
    s = suv(
        model=request.json['model'],
        start_year=request.json['start_year'],
        end_year=request.json['end_year'],
        manufacturer_id=request.json['manufacturer_id'],
        wiki_page=request.json['wiki_page']
    )
    db.session.add(s)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(s.serialize())
