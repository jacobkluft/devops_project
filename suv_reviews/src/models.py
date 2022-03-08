from flask_sqlalchemy import SQLAlchemy
from numpy import rec
from sqlalchemy import ForeignKey

db = SQLAlchemy()

# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


class manufacturer(db.Model):
    __tablename__ = 'manufacturers'
    manufacturer_id = db.Column(
        db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(32), unique=True, nullable=False)
    # countries should be in it's own table but just added as a string for simplicity
    country = db.Column(db.String(32), nullable=False)
    suvs = db.relationship('suv', backref='manufacturer', lazy=True)

    def __init__(self, name: str):
        self.name = name


class suv(db.Model):
    __tablename__ = 'suvs'
    suv_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    model = db.Column(db.String(32), unique=True, nullable=False)
    wiki_page = db.Column(db.String(128), nullable=True)
    start_year = db.Column(db.Integer, nullable=False)
    end_year = db.Column(db.Integer, nullable=False)
    manufacturer_id = db.Column(db.Integer, db.ForeignKey(
        manufacturer.manufacturer_id), nullable=False)

    def __init__(self, model: str, wiki_page: str, start_year: int, end_year: int, manufacturer_id: int):
        self.model = model
        self.wiki_page = wiki_page
        self.start_year = start_year
        self.end_year = end_year,
        self.manufacturer_id = manufacturer_id

    def serialize(self):
        return {
            'suv_id': self.suv_id,
            'model': self.model,
            'wiki_page': self.wiki_page,
            'start_year': self.start_year,
            'end_year': self.end_year,
            'manufacturer_id': self.manufacturer_id
        }


class market(db.Model):
    __tablename__ = 'markets'
    market_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(32), unique=True, nullable=False)

    def __init__(self, name: str):
        self.name = name


class kbb(db.Model):
    __tablename__ = 'kbb_reviews'
    kbb_review_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    suv_year_id = db.Column(db.ForeignKey("suv_years.id"), nullable=False)
    reviews = db.Column(db.Integer, nullable=False)
    score = db.Column(db.Numeric(3, 2), nullable=False)
    recomended = db.Column(db.Integer, nullable=False)

    def __init__(self, suv_year_id: int, reviews: int, score: float, recomended: float):
        self.suv_year_id = suv_year_id
        self.reviews = reviews
        self.score = score
        self.recomended = recomended

    def serialize(self):
        return {
            'kbb_review_id': int(self.kbb_review_id),
            'suv_year_id': int(self.suv_year_id),
            'reviews': int(self.reviews),
            'score': float(self.score),
            'recomended': float(self.recomended)
        }


class edmunds(db.Model):
    __tablename__ = 'edmunds_reviews'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    suv_year_id = db.Column(db.ForeignKey("suv_years.id"), nullable=False)
    reviews = db.Column(db.Integer, nullable=False)
    score = db.Column(db.Numeric(3, 2), nullable=False)

    def __init__(self, suv_year_id: int, reviews: int, score: float):
        self.suv_year_id = suv_year_id
        self.reviews = reviews
        self.score = score


class cars_dotcom(db.Model):
    __tablename__ = 'cars_dotcom_reviews'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    suv_year_id = db.Column(db.ForeignKey("suv_years.id"), nullable=False)
    reviews = db.Column(db.Integer, nullable=False)
    score = db.Column(db.Numeric(3, 2), nullable=False)
    cost_new = db.Column(db.Numeric(6, 0), nullable=True)

    def __init__(self, suv_year_id: int, reviews: int, score: float, cost_new: float):
        self.suv_year_id = suv_year_id
        self.reviews = reviews
        self.score = score
        self.cost_new = cost_new


sales_region = db.Table(
    'sales_regions',
    db.Column(
        'id', db.Integer,
        autoincrement=True,
        primary_key=True
    ),
    db.Column(
        'manufacturer_id', db.Integer,
        db.ForeignKey('manufacturers.manufacturer_id'),
        nullable=False
    ),
    db.Column(
        'market_id', db.Integer,
        db.ForeignKey('markets.market_id'),
        nullable=False
    )
)

suv_year = db.Table(
    'suv_years',
    db.Column(
        'id', db.Integer,
        autoincrement=True,
        primary_key=True
    ),
    db.Column(
        'suv_id', db.Integer,
        db.ForeignKey('suvs.suv_id'),
        nullable=False
    ),
    db.Column(
        'year', db.Integer,
        nullable=False
    )
)
