from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "CloudScale DevOps Project"

@app.route("/health")
def health():
    return "OK", 200