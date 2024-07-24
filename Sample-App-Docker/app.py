
## Application Code

### app.py

###This is a simple Flask application that returns "Hello, World!" when accessed.

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
