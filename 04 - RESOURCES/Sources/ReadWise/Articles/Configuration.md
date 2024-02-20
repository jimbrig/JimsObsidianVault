---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://flask-monitoringdashboard.readthedocs.io/en/latest/configuration.html
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Configuration
  - Configuration
---
# Configuration

## Metadata
- Author: [[flask-monitoringdashboard.readthedocs.io]]
- Full Title: Configuration
- Category: #Type/Highlight/Article
- URL: https://flask-monitoringdashboard.readthedocs.io/en/latest/configuration.html

## Highlights
- You can use a single configuration file for all options below. This is explained in the following section. In order to configure the Dashboard with a configuration-file, you can use the following function: ([View Highlight](https://read.readwise.io/read/01gvf5bhqg3e4hjrme38hx309c))
- dashboard.config.init_from(file='/<path to file>/config.cfg' ([View Highlight](https://read.readwise.io/read/01gvf5bn555qwte6jeb6jd4rk1))
- from flask import Flask import flask_monitoringdashboard as dashboard app = Flask(__name__) dashboard.config.init_from(file='/<path to file>/config.cfg') # Make sure that you first configure the dashboard, before binding it to your Flask application dashboard.bind(app) ... @app.route('/') def index(): return 'Hello World!' if __name__ == '__main__': app.run(debug=True) ([View Highlight](https://read.readwise.io/read/01gvf5c2gztc48hvpqxekp9sew))
- it is also possible to define an environment variable that specifies the location of this config file ([View Highlight](https://read.readwise.io/read/01gvf5ceq1wssemcqax706pehz))
- dashboard.config.init_from(envvar='FLASK_MONITORING_DASHBOARD_CONFIG') ([View Highlight](https://read.readwise.io/read/01gvf5d3zxamnkh21tvab7t7mh))
- This will configure the Dashboard based on the file provided in the environment variable called FLASK_MONITORING_DASHBOARD_CONFIG. ([View Highlight](https://read.readwise.io/read/01gvf5d8c93pnht5ea5b8zvsrb))
- [dashboard] APP_VERSION=1.0 GIT=/<path to your project>/.git/ CUSTOM_LINK=dashboard MONITOR_LEVEL=3 OUTLIER_DETECTION_CONSTANT=2.5 SAMPLING_PERIOD=20 ENABLE_LOGGING=True [authentication] USERNAME=admin PASSWORD=admin SECURITY_TOKEN=cc83733cb0af8b884ff6577086b87909 [database] TABLE_PREFIX=fmd DATABASE=sqlite:////<path to your project>/dashboard.db [visualization] TIMEZONE=Europe/Amsterdam COLORS={'main':'[0,97,255]', 'static':'[255,153,0]'} ([View Highlight](https://read.readwise.io/read/01gvf5ds790e7vm3pyc4wdd6k6))
- Dashboard ([View Highlight](https://read.readwise.io/read/01gvf5dyfj1hkmrzp36vmw4rc6))
- Dashboard ([View Highlight](https://read.readwise.io/read/01gvf5dzr7text2pvr3j5052x1))
- **APP_VERSION:** The version of the application that you use. Updating the version allows seeing the changes in the execution time of requests over multiple versions. ([View Highlight](https://read.readwise.io/read/01gvf5e1am0h6zpz0m2f68zm12))
- **APP_VERSION:** The version of the application that you use. Updating the version allows seeing the changes in the execution time of requests over multiple versions. ([View Highlight](https://read.readwise.io/read/01gvf5e2bdjbt8y15jnm48kdjb))
- **GIT:** Since updating the version in the configuration-file when updating code isn’t very convenient, another way is to provide the location of the git-folder. From the git-folder, the version is automatically retrieved by reading the commit-id (hashed value). The specified value is the location to the git-folder. This is relative to the configuration-file. ([View Highlight](https://read.readwise.io/read/01gvf5e4b15mm6st624tfcrw04))
- **GIT:** Since updating the version in the configuration-file when updating code isn’t very convenient, another way is to provide the location of the git-folder. From the git-folder, the version is automatically retrieved by reading the commit-id (hashed value). The specified value is the location to the git-folder. This is relative to the configuration-file. ([View Highlight](https://read.readwise.io/read/01gvf5e4b5es2s7b1qn4n3x8bq))
- **CUSTOM_LINK:** The Dashboard can be visited at localhost:5000/{{CUSTOM_LINK}}. ([View Highlight](https://read.readwise.io/read/01gvf5e6akrk2pqkvhbstn9t1f))
- **MONITOR_LEVEL**: The level for monitoring your endpoints. The default value is 3. For more information, see the Overview page of the Dashboard. ([View Highlight](https://read.readwise.io/read/01gvf5e7jj2str9x167nz01s5k))
- **OUTLIER_DETECTION_CONSTANT:** When the execution time is greater than constant∗average, extra information is logged into the database. A default value for this variable is 2.5. ([View Highlight](https://read.readwise.io/read/01gvf5e99a41ka5vbw17ewsgys))
- **SAMPLING_PERIOD:** Time between two profiler-samples. The time must be specified in ms. If this value is not set, the profiler monitors continuously. ([View Highlight](https://read.readwise.io/read/01gvf5eaywzersmknp4f3mmh4d))
- **ENABLE_LOGGING:** Boolean if you want additional logs to be printed to the console. Default value is False. ([View Highlight](https://read.readwise.io/read/01gvf5ec9s2s6ckszb5hjwnkvn))
- Authentication ([View Highlight](https://read.readwise.io/read/01gvf5edja6trd0ye2k3bhrw91))
- **USERNAME** and **PASSWORD:** Must be used for logging into the Dashboard. Both are required. ([View Highlight](https://read.readwise.io/read/01gvf5efj9faxp68zrhxa426d0))
- **SECURITY_TOKEN:** The token that is used for exporting the data to other services. If you leave this unchanged, any service is able to retrieve the data from the database. ([View Highlight](https://read.readwise.io/read/01gvf5efjaa83f3f18rwccz7rr))
- Database ([View Highlight](https://read.readwise.io/read/01gvf5ehmt9zwf0n962246xr9b))
- **TABLE_PREFIX:** A prefix to every table that the Flask-MonitoringDashboard uses, to ensure that there are no conflicts with the other tables, that are specified by the user of the dashboard. ([View Highlight](https://read.readwise.io/read/01gvf5ejxd2apdvggx9dzgy8q6))
- **DATABASE:** Suppose you have multiple projects that you’re working on and want to separate the results. Then you can specify different database_names, such that the result of each project is stored in its own database. ([View Highlight](https://read.readwise.io/read/01gvf5emfh5tkehe8xt75trg6q))
- Visualization ([View Highlight](https://read.readwise.io/read/01gvf5ep9jessgve4pqv9x7ev1))
- **TIMEZONE:** The timezone for converting a UTC timestamp to a local timestamp. For a list of all timezones, use the following: ([View Highlight](https://read.readwise.io/read/01gvf5eqzn1pq18c9emgebxt7n))
- **TIMEZONE:** The timezone for converting a UTC timestamp to a local timestamp. For a list of all timezones, use the following:
  import pytz # pip install pytz
  print(pytz.all_timezones)
  The dashboard saves the time of every request by default in a UTC-timestamp. However, if you want to display it in a local timestamp, you need this property. ([View Highlight](https://read.readwise.io/read/01gvf5eshxdf7260e8a3x5sjdb))
- **COLORS:** The endpoints are automatically hashed into a color. However, if you want to specify a different color for an endpoint, you can set this variable. It must be a dictionary with the endpoint-name as a key, and a list of length 3 with the RGB-values. For example: ([View Highlight](https://read.readwise.io/read/01gvf5ex2pccjb21htgx6ysc5s))
- **COLORS:** The endpoints are automatically hashed into a color. However, if you want to specify a different color for an endpoint, you can set this variable. It must be a dictionary with the endpoint-name as a key, and a list of length 3 with the RGB-values. For example:
  COLORS={'main':'[0,97,255]',
  'static':'[255,153,0]'} ([View Highlight](https://read.readwise.io/read/01gvf5f1xev011hexr3nhg3479))
