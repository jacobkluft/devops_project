from src.models import suv, manufacturer, db
import json
import urllib.request
from urllib.request import urlopen


# suv.index returns all the suv records in the database in JSON format
# fail if there are no records returned


def test_get_all_suvs():
    url = "http://localhost:5000/suv"
    response = urlopen(url)
    suvs = json.loads(response.read())
    assert len(suvs) > 0

# returns one SUV with an suv_id of 2
# fail if no records are returned


def test_get_one_suv():
    url = "http://localhost:5000/suv/2"
    response = urlopen(url)
    suvs = json.loads(response.read())
    assert len(suvs) > 0

# returns all of the Kelly Blue Book reviews for one model/year combo
# fail if no records are returned


def test_get_kbb_reviews():
    url = "http://localhost:5000/kbb/10"
    response = urlopen(url)
    reviews = json.loads(response.read())
    assert len(reviews) > 0

# Inserts one Kelly Blue Book review
# fail if an error is returned


def test_add_kbb_review():
    post_url = "http://localhost:5000/kbb"
    data = {
        "suv_year_id": "15",
        "reviews": "202",
        "score": "4.7",
        "recomended": "92"
    }

    # Dump the todo object as a json string
    data = json.dumps(data)

    # Create the request object
    req = urllib.request.Request(url=post_url, data=bytes(
        data.encode("utf-8")), method="POST")

    # Post the request
    assert post_request(req)

# Inserts one suv record into the suvs table
# fail if an error is returned


def test_add_suv():
    post_url = "http://localhost:5000/suv"
    data = {
        "model": "Land Cruzer",
        "start_year": "1975",
        "end_year": "2022",
        "manufacturer_id": "1",
        "wiki_page": "https://www.wikipedia.com/toyota/land_cruzer"
    }

    # Dump the todo object as a json string
    data = json.dumps(data)

    # Create the request object
    req = urllib.request.Request(url=post_url, data=bytes(
        data.encode("utf-8")), method="POST")

    # Post the request
    assert post_request(req)

# Updates one kelly blue book review record
# fail if an error is returned


def test_update_kbb_reviews():
    kbb_review_id = 35
    post_url = "http://localhost:5000/kbb/" + \
        str(kbb_review_id) + "?reviews=100&score=4.5&recomended=80.0"

    # Create the request object
    req = urllib.request.Request(url=post_url, data=None, method="PUT")

    # Post the request
    assert post_request(req)


# delete all rows in the kbb_review table where the suv_year_id is equal to the input id


def delete_kbb_review():
    suv_year_id = 14
    post_url = "http://localhost:5000/kbb/" + str(suv_year_id)

    # Create the request object
    req = urllib.request.Request(url=post_url, data=None, method="DELETE")

    # Post the request
    assert post_request(req)

# returns true if successful post


def post_request(request):
    # Add the appropriate header.
    request.add_header("Content-type", "application/json; charset=UTF-8")

    try:
        # post to the api
        response = urllib.request.urlopen(request)
        return True
    except:
        return False
