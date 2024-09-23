from . import app

@app.route('/')
def hello_world():
    return 'Hello Salmon AI World!'

if __name__ == '__main__':
    app.run('0.0.0.0', port=5000, debug=True)