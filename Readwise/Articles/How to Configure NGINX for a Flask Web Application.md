---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://www.patricksoftwareblog.com/how-to-configure-nginx-for-a-flask-web-application/
Tags: ["#Type/Highlight/Article"]
Aliases: ["How to Configure NGINX for a Flask Web Application", "How to Configure NGINX for a Flask Web Application"]
---
# How to Configure NGINX for a Flask Web Application

## Metadata
- Author: [[patkennedy79@gmail.com]]
- Full Title: How to Configure NGINX for a Flask Web Application
- Category: #Type/Highlight/Article
- URL: https://www.patricksoftwareblog.com/how-to-configure-nginx-for-a-flask-web-application/

## Highlights
- ’ve found a lot of documentation about NGINX and how to configure it, but I wanted to dive into the details for how NGINX can be used in a Flask web application and how to configure it. I’ve found the configuration of NGINX to be a bit confusing, as a lot of the documentation simply shows a configuration file(s) without explaining the details of what each step does. Hopefully this blog post provides some clarity on configuring NGINX for your application. ([View Highlight](https://read.readwise.io/read/01gtsnxbbrt1cztde654hqhkre))
- What is NGINX? ([View Highlight](https://read.readwise.io/read/01gtsnxed9bntb37g25gzg6h51))
- From the NGINX (pronounced ‘engine-X’) website, here is the high-level description of the tool:
  *NGINX is a free, open-source, high-performance HTTP server and reverse proxy, as well as an IMAP/POP3 proxy server. NGINX is known for its high performance, stability, rich feature set, simple configuration, and low resource consumption.* ([View Highlight](https://read.readwise.io/read/01gtsnxnp31sh7n1ypw7mcc6gc))
- Let’s expand on this description… NGINX is a server that handles [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) requests for your web application. For a typical web application, NGINX can be configured to perform the following with these HTTP requests:
  • [Reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) the request to an upstream server (such as Gunicorn, uWsgi, Apache, etc.)
  • Server static content (Javascript files, CSS files, images, documents, static HTML files)
  NGINX also provides a [load balancing](http://nginx.org/en/docs/http/load_balancing.html) capability to allow requests to be serviced by multiple upstream servers, but that functionality is not discussed in this blog post. ([View Highlight](https://read.readwise.io/read/01gtsny0h3mn72j8qqc4796n46))
- Here’s a diagram illustrating how NGINX fits into a Flask web application:
  [![](https://i2.wp.com/www.patricksoftwareblog.com/wp-content/uploads/2016/09/NGINX-in-Production-Environment.png?w=938&ssl=1)](https://i2.wp.com/www.patricksoftwareblog.com/wp-content/uploads/2016/09/NGINX-in-Production-Environment.png?ssl=1)
  NGINX handles the HTTP requests that come in from the internet (ie. the users of your application). ([View Highlight](https://read.readwise.io/read/01gtsnyaaxmk9fez1jh5n1zq6p))
- This diagram assumes the use of Docker, but the configuration of NGINX would be very similar if not using Docker (just omit the concept of containers from the diagram). ([View Highlight](https://read.readwise.io/read/01gtsnyh6mjc8g3qvdagq32j56))
- Why do you need NGINX and Gunicorn? ([View Highlight](https://read.readwise.io/read/01gtsnyexj66r0mrb8krmgsph1))
- NGINX is a HTTP server that is used in lots of different application [stacks](https://www.nginx.com/resources/wiki/start/#pre-canned-configurations). It performs a lot of functions, but it is not able to directly interface with a Flask application. That is where [Gunicorn](http://gunicorn.org/) comes in to play. HTTP requests are received by NGINX and passed along to Gunicorn to be processed by your Flask application (think of the route(s) defined in your views.py). Gunicorn is a WSGI server that handles HTTP requests and routes them to any python application that is WSGI-compliant, such as Flask, Django, Pyramid, etc. ([View Highlight](https://read.readwise.io/read/01gtsnynb0t9ax04d5e2h97c1g))
