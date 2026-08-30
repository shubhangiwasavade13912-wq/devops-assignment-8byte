from flask import Flask
app = Flask(__name__)
@app.route("/")
def home():
    return "DevOps Assignment Application is Running!"
@app.route("/health")
def health():
    return "Healthy"
if __name__ == "_main_":
    app.run(host="0.0.0.0", port=80)