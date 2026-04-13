from flask import Flask, render_template
import os
import socket

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html',
        version=os.environ.get('APP_VERSION', 'v1.0.0'),
        pod_name=socket.gethostname()
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
