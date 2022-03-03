from flask import Blueprint, jsonify, abort, request
from ..models import manufacturer, suv, market, kbb, edmunds, cars_dotcom, sales_region, suv_year, db

bp = Blueprint('kbb', __name__, url_prefix='/kbb')

# returns all Kelly Blue Book reviews for a given SUV and year (suv_year_id)


@bp.route('/<int:id>', methods=['GET'])
def get_reviews(id: int):
    kbb_reviews = kbb.query.all()  # ORM performs SELECT query
    result = []
    for r in kbb_reviews:
        if r.suv_year_id == id:
            # build list of tweets as dictionaries
            result.append(r.serialize())
    return jsonify(result)  # return JSON response

# inserts a new Kelly Blue Book Review


@bp.route('', methods=['POST'])
def add_kbb_review():
    # check for required inputs
    if 'suv_year_id' not in request.json or 'reviews' not in request.json or 'score' not in request.json or 'recomended' not in request.json:
        return abort(400)
    # the suv_id and year must exist
    stmt = suv_year.select().where(
        suv_year.c.id == request.json['suv_year_id'])
    if stmt == None:
        return abort(404)
    # construct KBB object
    k = kbb(
        suv_year_id=request.json['suv_year_id'],
        reviews=request.json['reviews'],
        score=request.json['score'],
        recomended=request.json['recomended']
    )
    db.session.add(k)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(k.serialize())

# updates an existing Kelly Blue Book Review


@bp.route('/<int:id>', methods=['PUT'])
def update(id: int):
    r = kbb.query.get_or_404(id)  # get the user from the database

    try:
        # update the reviews
        num_reviews = request.json['reviews']
        if num_reviews != None:
            r.num_reviews = num_reviews

        # update the score
        score = request.json['score']
        if score != None:
            r.score = score

        # update the recomended
        recomended = request.json['recomended']
        if recomended != None:
            r.recomended = recomended

        db.session.commit()  # execute the update statement
        return jsonify(True)

    except:
        # something went wrong :(
        return jsonify(False)


# deletes one existing Kelly Blue Book Review where the suv_year_id is equal to the input id


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    kbb_reviews = kbb.query.all()  # ORM performs SELECT query

    for r in kbb_reviews:
        if r.suv_year_id == id:
            try:
                db.session.delete(r)  # prepare DELETE statement
                db.session.commit()  # execute DELETE statement
                return jsonify(True)
            except:
            # something went wrong :(
                return jsonify(False)
                
    # unable to find the suv_year_id in the kbb_reviews table
    return jsonify(False)
