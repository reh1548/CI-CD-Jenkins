from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Rehan! This is your Mr. Python. You have successfully built, tested, deployed and ran me!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
