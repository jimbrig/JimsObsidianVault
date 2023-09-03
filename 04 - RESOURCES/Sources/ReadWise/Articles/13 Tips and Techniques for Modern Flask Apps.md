---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://pgjones.dev/blog/modern-flask-2023/
Tags: ["#Type/Highlight/Article"]
Aliases: ["13 Tips and Techniques for Modern Flask Apps", "13 Tips and Techniques for Modern Flask Apps"]
---
# 13 Tips and Techniques for Modern Flask Apps

## Metadata
- Author: [[pgjones.dev]]
- Full Title: 13 Tips and Techniques for Modern Flask Apps
- Category: #Type/Highlight/Article
- URL: https://pgjones.dev/blog/modern-flask-2023/

## Highlights
- Flask is approaching its 13th birthday in active development, with new features that make it easier for you to build your web application continually being added. Thirteen years ago the industry and Flask focused on server rendered pages, now there is a strong focus on JSON APIs. Flask has kept up with this change by adding features that make API development easier. ([View Highlight](https://read.readwise.io/read/01h0zqrk5karb0etf9ze8a9g25))
- In this article I've picked out 13 tips, for the 13 years of development, that make modern Flask ideal. To begin with, here is a simple teaser of what is possible: ([View Highlight](https://read.readwise.io/read/01h0zqrpex4kp41j8aswvs7stw))
- @app.get("/") def index() -> ResponseReturnValue: return {"hello": "world"} ([View Highlight](https://read.readwise.io/read/01h0zqs32jtv7g493xw4hgry6t))
- 1. Shorthand method decorators ([View Highlight](https://read.readwise.io/read/01h0zqs6ckjtcfrf95kev5bc48))
- Flask pioneered the concise decorator approach for defining the path-handler relationship in a form that allows for multiple HTTP-methods. This is particularly useful for server rendered forms, as shown: ([View Highlight](https://read.readwise.io/read/01h0zqs8aybtzxr7e6cmankxcv))
- from flask import redirect, render_template, request, url_for @app.route("/page", methods={"GET", "POST"}) def page(): if request.method: ... # Handle form post return redirect(url_form("home")) return render_template("form.html") ([View Highlight](https://read.readwise.io/read/01h0zqscp6x92g947xsref93mk))
- When writing APIs this syntax can get cumbersome and so the modern approach in Flask is to use a shorthand when only one HTTP-method is needed, as shown: ([View Highlight](https://read.readwise.io/read/01h0zqsf6spvkgc94qetkkh9vj))
- All the common HTTP-methods `{GET, POST, PUT, DELETE, PATCH}` are available in shorthand whilst the other methods `{HEAD, CONNECT, OPTIONS, TRACE}` are automatically handled by Flask. ([View Highlight](https://read.readwise.io/read/01h0zqshjhtb5c21x92rd3x9w3))
- Flask provides the `jsonify` function to create a JSON response, rather than a HTML response: ([View Highlight](https://read.readwise.io/read/01h0zqsrnw0q3bk5admhvhq0v3))
- As with the `route` decorator, this syntax can be cumbersome and so the modern approach is to return the dictionary directly: ([View Highlight](https://read.readwise.io/read/01h0zqsxnfg0k57ts7hsbqdtvq))
- I find in practice it is preferable to always return an envelope, however list responses are also understood as JSON: ([View Highlight](https://read.readwise.io/read/01h0zqt01t47fs2dkte2x98sw2))
- 3. Configuration via the environment ([View Highlight](https://read.readwise.io/read/01h0zqt57y7dt1nbjvspvej7p8))
- A [Twelve-Factor](https://12factor.net/) app will store its config in the environment rather than in a file or elsewhere. This is now supported in Flask via the config `from_prefixed_env` method: ([View Highlight](https://read.readwise.io/read/01h0zqt7yewpa3p1zvs7v65jyg))
- 4. Autogenerated OpenAPI documentation ([View Highlight](https://read.readwise.io/read/01h0zqv0wkqwj5kgtdsnq9p8t2))
- When writing RESTful APIs, OpenAPI has become the go to standard for documenting the API for both human and computer usage. On this basis many libraries that offer serialisation and validation have added autogeneration of OpenAPI schemas. As always Flask takes a agnostic stance with the Flask ecosystem suppling many great options. For example with Marshmallow, consider [APIFlask](https://apiflask.com/): ([View Highlight](https://read.readwise.io/read/01h0zqv3fy6k3jadsre68rgrm1))
- 5. Type hinting ([View Highlight](https://read.readwise.io/read/01h0zqvdesmfs0crq7jq9z3ans))
- Using type hints and type checkers have really improved the quality of my code. Fortunately, Flask is fully type hinted which helps ensure any code I write using Flask is also checked. For example the `ResponseReturnValue` type can be used to check that you return a valid value: ([View Highlight](https://read.readwise.io/read/01h0zqvfwxvgwjn0tx9e5yyg7k))
- As the correct return value should be `return "Hello", status, headers` type checkers will error saving an annoying runtime failure. ([View Highlight](https://read.readwise.io/read/01h0zqvkabh54s993b278nnd0y))
- Please note that `ResponseReturnValue` does not have to be used, a specific return value will also be checked. ([View Highlight](https://read.readwise.io/read/01h0zqvp1q25d7sxc2xkrvg288))
- 6. Using async libraries ([View Highlight](https://read.readwise.io/read/01h0zqvsj0dsfdn5b3d48eevjw))
- With the introduction of async/await in Python 3.5 many new libraries have been written utilising the syntax. To use these libraries the calling code must be a async function. This is now possible in flask: ([View Highlight](https://read.readwise.io/read/01h0zqvw9acfyd1n35w22j2q26))
- 7. Nested blueprints ([View Highlight](https://read.readwise.io/read/01h0zqw56b5b3wpqkxwvax5a9a))
- Flask allows apps to be split into blueprints, thereby allowing related routes to be grouped together. Modern Flask allows nested blueprints, thereby allowing related routes to be grouped together across multiple blueprints. ([View Highlight](https://read.readwise.io/read/01h0zqw7xswz7ydf7jbnhsfrdr))
- As an example consider having an monitor blueprint that you wish to use on both the shop and admin parts of your app: ([View Highlight](https://read.readwise.io/read/01h0zqwb0rn1kna3dfxg61yz14))
- shop = Blueprint("shop", __name__) admin = Blueprint("admin", __name__) monitor = Blueprint("monitor", __name__) @monitor.get("/") def status(): retrun {"running": True} admin.register_blueprint(monitor, url_prefix="/monitor") shop.register_blueprint(monitor, url_prefix="/monitor") app.register_blueprint(admin, url_prefix="/admin") app.register_blueprint(shop, url_prefix="/shop") ([View Highlight](https://read.readwise.io/read/01h0zqwm08dhg2ctajmwf1xaxy))
- The paths `/admin/monitor` and `/shop/monitor` now both call the `status` route-handler. Alternatively to using url prefixes Blueprints can also be given subdomains that nest. ([View Highlight](https://read.readwise.io/read/01h0zqwpxdq0tyztfa6pptaj0r))
- 8. Customising JSON serialisation ([View Highlight](https://read.readwise.io/read/01h0zqwwrsb1xvv4013jhcjxje))
- By default Flask serialises JSON using the standard library `json` module. This can be customised, for example to support additional features, or to utilise a more performant serialiser. This customisation is achieved by implementing a JSONProvider. For example using [orjson](https://pypi.org/project/orjson) (a faster serialiser) can be achieved via: ([View Highlight](https://read.readwise.io/read/01h0zqwzhkqv8xqx8t5fqxyr46))
- import orjson from flask.json.provider import JSONProvider class OrJSONProvider(JSONProvider): def dumps(self, obj, *, option=None, **kwargs): if option is None: option = orjson.OPT_APPEND_NEWLINE | orjson.OPT_NAIVE_UTC return orjson.dumps(obj, option=option).decode() def loads(self, s, **kwargs): return orjson.loads(s) app.json = OrJSONProvider(app) ([View Highlight](https://read.readwise.io/read/01h0zqxh69mwe031bhqmejbwv5))
- 9. Customising url_for, abort, and redirect ([View Highlight](https://read.readwise.io/read/01h0zqxs3ypjk7fc83qdc0tx3z))
- The Flask helper functions `url_for`, `abort`, and `redirect` are now customisable allowing you to define what they do. This follows the Flask pattern of allowing customisation via app methods, specifically `app.url_for`, `app.aborter`, and `app.redirect`. ([View Highlight](https://read.readwise.io/read/01h0zqxx1emv3fdtk17srmaqz0))
- 10. Using `flask run` ([View Highlight](https://read.readwise.io/read/01h0zqy8fhc1tcrjjsextcjkym))
- Flask apps have a `run` method allowing the app to be run in development, However, the better modern way is to call `flask run` on the command line. This is best used with the `--app` option to specify the app to run e.g. if the app is called `app` in the module `main.py` the explicit command is: ([View Highlight](https://read.readwise.io/read/01h0zqyanmd934yh4vs9mk66e4))
- flask --app main:app run ([View Highlight](https://read.readwise.io/read/01h0zqyrad3che8x0mysktzd74))
- I'd recommend adding the `--debug` flag to trigger the reloader (so that the app reloads on code changes): ([View Highlight](https://read.readwise.io/read/01h0zqyvvw44kgrzg8wxe363xq))
- 11. Custom command line interface ([View Highlight](https://read.readwise.io/read/01h0zqz13sgye99nsmwjy1v4f7))
- It is possible to extend the `flask` CLI with your own custom commands, for example to create a user called `bob` via `flask create-user bob` the following can be used: ([View Highlight](https://read.readwise.io/read/01h0zqz3jpf4vsv41e2477ewth))
- import click @app.cli.command("create-user") @click.argument("name") def create_user(name): ... ([View Highlight](https://read.readwise.io/read/01h0zqz7rrwt44t9jr18a5te84))
- The full capabilities of [click](https://click.palletsprojects.com) (another Pallets project) are available. ([View Highlight](https://read.readwise.io/read/01h0zqzbazwj2hretj9b9p15ac))
- 12. Async workers ([View Highlight](https://read.readwise.io/read/01h0zqzfss2x7pxv9wx1r48t1d))
- Whilst technically not a new feature, I find many people to be unaware that Flask can be deployed with async workers. Specifically I mean running within an event loop that yields on IO, much like asyncio provides via the standard library. Using an async worker will almost certainly improve the performance of your app, as web applications often do a lot of concurrent IO. ([View Highlight](https://read.readwise.io/read/01h0zqzj94k3f1rj8324jkygn1))
- I like to use the [gevent](https://www.gevent.org/) worker with [Gunicorn](https://gunicorn.org) for this, firstly by installing `pip install gunicorn[gevent]` and then running my app via: ([View Highlight](https://read.readwise.io/read/01h0zqzqvjbef7ac826s2dwkze))
- gunicorn -k gevent main:app ([View Highlight](https://read.readwise.io/read/01h0zqzzwn29ts4yc8exrfzvt1))
- 13. Using Quart ([View Highlight](https://read.readwise.io/read/01h0zr036et6sy8wbdp5pegt1t))
- Quart is a reimplementation of Flask using async/await thereby being an [ASGI](https://asgi.readthedocs.io/en/latest/) rather than [WSGI](https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface) framework (as Flask is). This allows async/await based libraries and extensions to be used throughout - whereas async/await is [limited](https://flask.palletsprojects.com/en/2.1.x/async-await/) to certain functions in Flask. ([View Highlight](https://read.readwise.io/read/01h0zr08g47yd5jxv6wcngz9jy))
- Our aim is to merge Flask and Quart once we overcome some large technical hurdles. For now we maintain both as part of the [Pallets](https://palletsprojects.com) group. ([View Highlight](https://read.readwise.io/read/01h0zr0ctw7ngvwp6ne92bykpr))