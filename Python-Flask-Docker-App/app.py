from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/page1')
def page1():
    return render_template('profession.html')

@app.route('/page2')
def page2():
    return render_template('travel.html')

@app.route('/page3')
def page3():
    return render_template('contactme.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
