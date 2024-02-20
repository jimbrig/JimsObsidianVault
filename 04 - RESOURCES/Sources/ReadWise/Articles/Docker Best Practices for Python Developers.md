---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://testdriven.io/blog/docker-best-practices/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Docker Best Practices for Python Developers
  - Docker Best Practices for Python Developers
---
# Docker Best Practices for Python Developers

## Metadata
- Author: [[Amal Shaji]]
- Full Title: Docker Best Practices for Python Developers
- Category: #Type/Highlight/Article
- URL: https://testdriven.io/blog/docker-best-practices/

## Highlights
- Use Multi-stage Builds ([View Highlight](https://read.readwise.io/read/01gtx369mb7aa1gq9pmjn5ty15))
- In this example, the [GCC](https://gcc.gnu.org/) compiler is required for installing certain Python packages, so we added a temp, build-time stage to handle the build phase. Since the final run-time image does not contain GCC, it's much lighter and more secure. ([View Highlight](https://read.readwise.io/read/01gtx3ecjkvxn0y2yf8hzfh2mc))
- Order Dockerfile Commands Appropriately
  *Pay close attention to the order of your Dockerfile commands to leverage layer caching.* ([View Highlight](https://read.readwise.io/read/01gtx3g7b7dk04vnwjsdb24p6y))
- Docker caches each step (or layer) in a particular Dockerfile to speed up subsequent builds. When a step changes, the cache will be invalidated not only for that particular step but all succeeding steps. ([View Highlight](https://read.readwise.io/read/01gtx3g9jqw4w31ybh0fv0ahpb))
- In this Dockerfile, we copied over the application code *before* installing the requirements. Now, each time we change *sample.py*, the build will reinstall the packages. This is very inefficient, especially when using a Docker container as a development environment. Therefore, it's crucial to keep the files that frequently change towards the end of the Dockerfile. ([View Highlight](https://read.readwise.io/read/01gtx3gnksc3k730k62r9ddf1h))
- You can also help prevent unwanted cache invalidations by using a *.dockerignore* file to exclude unnecessary files from being added to the Docker build context and the final image. More on this here shortly. ([View Highlight](https://read.readwise.io/read/01gtx3h2nce4kbhp1scf9grk4g))
- Always put layers that are likely to change as low as possible in the Dockerfile. ([View Highlight](https://read.readwise.io/read/01gtx3htspq1w6pc7xk1rqb6f2))
- Combine `RUN apt-get update` and `RUN apt-get install` commands. (This also helps to reduce the image size. We'll touch on this shortly.) ([View Highlight](https://read.readwise.io/read/01gtx3hx5px79hdy5tb2ygdqd9))
- If you want to turn off caching for a particular Docker build, add the `--no-cache=True` flag. ([View Highlight](https://read.readwise.io/read/01gtx3j5k3derv1gp1tcb1qm53))
- Use Small Docker Base Images
  *Smaller Docker images are more modular and secure.*
  Building, pushing, and pulling images is quicker with smaller images. They also tend to be more secure since they only include the necessary libraries and system dependencies required for running your application. ([View Highlight](https://read.readwise.io/read/01gtx3jfneshs0vf71hh42463q))
- In the end, it's all about balance. When in doubt, start with a `*-slim` flavor, especially in development mode, as you're building your application. You want to avoid having to continually update the Dockerfile to install necessary system-level dependencies when you add a new Python package. As you harden your application and Dockerfile(s) for production, you may want to explore using Alpine for the final image from a multi-stage build. ([View Highlight](https://read.readwise.io/read/01gtx3k7ebayytsjgrmnv07w1m))
- Minimize the Number of Layers
  It's a good idea to combine the `RUN`, `COPY`, and `ADD` commands as much as possible since they create layers. Each layer increases the size of the image since they are cached. Therefore, as the number of layers increases, the size also increases.
  You can test this out with the `docker history` command: ([View Highlight](https://read.readwise.io/read/01gtx3m9m51z9rvbc9490b4ews))
- HEALTHCHECK CMD curl --fail http://localhost:8000 || exit 1 ([View Highlight](https://read.readwise.io/read/01gtx3rva8vpcwcjexc0sb06dr))
- You can take it a step further and set up a custom endpoint used only for health checks and then configure the `HEALTHCHECK` to test against the returned data. For example, if the endpoint returns a JSON response of `{"ping": "pong"}`, you can instruct the `HEALTHCHECK` to validate the response body. ([View Highlight](https://read.readwise.io/read/01gtx3sgapngyrbzdb49jpq37m))
- Here's how you view the status of the health check status using `docker inspect`: ([View Highlight](https://read.readwise.io/read/01gtx3swyvyh1740dw4ha76kvj))
- docker inspect --format "{{json .State.Health }}" ab94f2ac7889 { "Status": "healthy", "FailingStreak": 0, "Log": [ { "Start": "2021-09-28T15:22:57.5764644Z", "End": "2021-09-28T15:22:57.7825527Z", "ExitCode": 0, "Output": "..." ([View Highlight](https://read.readwise.io/read/01gtx3t2bjfexe86dvj1vwez8k))
- You can also add a health check to a Docker Compose file:
  version: "3.8"
  services:
  web:
  build: .
  ports:
  - '8000:8000'
  healthcheck:
  test: curl --fail http://localhost:8000 || exit 1
  interval: 10s
  timeout: 10s
  start_period: 10s
  retries: 3 ([View Highlight](https://read.readwise.io/read/01gtx3tf04zerzbe3gkaw2b1aj))
