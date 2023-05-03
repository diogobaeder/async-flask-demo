import time

from flask import Flask, jsonify


app = Flask(__name__)


@app.route('/sleep/<float:amount>')
def hello_world(amount: float):
    time.sleep(amount)
    return jsonify(True)
