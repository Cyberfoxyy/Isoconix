from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from werkzeug.datastructures import  FileStorage
from flask_mail import Mail, Message
from datetime import datetime
import json
import os
import math

with open('config.json', 'r') as c:
 params = json.load(c)["params"]

local_server = True

# create the extension

# create the app
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config ['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)
if (local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
# configure the SQLite database, relative to the app instance folder
# initialize the app with the extension
db = SQLAlchemy()
db.init_app(app)


class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(140), nullable=False)
    date = db.Column(db.String(20), nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    slug = db.Column(db.String(20), nullable=False)
    content = db.Column(db.String(220), nullable=False)
    date = db.Column(db.String(20), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)

@app.route("/")
def home():
    return render_template('index.html', params=params)


@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/social-media")
def social():
    return render_template('social-media.html', params=params)

@app.route("/courses")
def courses():
    return render_template('courses.html', params=params)


@app.route("/trainers")
def trainers():
    return render_template('trainers.html', params=params)


@app.route("/pricing")
def pricing():
    return render_template('pricing.html', params=params)

@app.route("/blogs")
def blogs():
    flash("Subscribe to Isoconix for more updates","success")
    flash("Purchase our for more updates","warning")
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    # [0:params['no_of_posts']]
 
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
#pagination logic
# First
    if(page==1):
        prev = "#"
        next = "/blogs?page="+ str(page+1) 
    elif(page==last):
        prev = "/blogs?page="+ str(page-1)
        next = "#"
    else:
        prev = "/blogs?page=" + str(page - 1)
        next = "/blogs?page=" + str(page + 1)
# First
# First
    return render_template('blogs.html', params=params, posts=posts, prev=prev, next=next)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html', params=params, post=post)

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if request.method=='POST': 
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    else:
        return render_template('member-login.html', params=params)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')




@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
     if (request.method=='POST'):
        f= request.files['file1']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return "Uploaded Successfully"

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
        if 'user' in session and session['user'] == params['admin_user']:
            post = Posts.query.filter_by(sno=sno).first()
            db.session.delete(post)
            db.session.commit()
        return redirect('/dashboard')



@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
        if 'user' in session and session['user'] == params['admin_user']:
            if (request.method =='POST'): 
                title = request.form.get('title')
                slug = request.form.get('slug')
                content = request.form.get('content')
                img_file = request.form.get('img_file')
                date = datetime.now()

                if sno =='0':
                    post = Posts(title=title, slug=slug, content=content, img_file=img_file, date=datetime.now())
                    db.session.add(post)
                    db.session.commit()
                else:
                    post = Posts.query.filter_by(sno=sno).first()
                    post.title = title
                    post.slug = slug
                    post.content = content
                    post.img_file = img_file
                    post.date = date
                    db.session.commit()
                    return redirect('/edit/'+sno)

            post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)





@app.route("/signup")
def signup():
    
     return render_template('signup.html', params=params)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone_num')
        message = request.form.get('message')
        entry = Contact(name=name, phone_num=phone_num,
                        email=email, msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from isoconix contact us page',
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message + "\n" "\n" + phone_num + "\n" + email)
        flash("Thank you for contacting us. We will get back to you soon.", "success")

    return render_template('contact.html', params=params)


app.run(debug=True)
