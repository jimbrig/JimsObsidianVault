---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://www.r-bloggers.com/2022/09/api-as-a-package-testing/
Tags: ["#Type/Highlight/Article"]
Aliases: ["API as a Package: Testing", "API as a Package: Testing"]
---
# API as a Package: Testing

## Metadata
- Author: [[The Jumping Rivers Blog]]
- Full Title: API as a Package: Testing
- Category: #Type/Highlight/Article
- URL: https://www.r-bloggers.com/2022/09/api-as-a-package-testing/

## Highlights
- This blog post is a follow on to our API as a package series, which
  looks to expand on the topic of testing {plumber} API applications
  within the package structure leveraging {testthat}.
- The three stages of testing
  The intended structure of the API as a package setup is to encourage a
  particular, consistent, composition of code for each exposed endpoint.
  That is:
  A plumber decorator that maps a package function to a URL
  A wrapper function that takes a request object, deals with any
  serialization of data and dispatches to a “business logic” function
  The “business logic” function, or core functionality of the purpose
  of a particular endpoint
- Does the running API application successfully return an appropriate
  response when we make a request to an endpoint?
  Does the wrapper function handle behaviour matching your
  expectations?
  Is my logic correct?
- Testing: Setup
  With the above example we are now ready to start writing some tests.
  There are a few elements which are likely to be common when wanting to
  test endpoints of an API application:
  Start an instance of your API
  Send a request to your local running API
  Create a mock object that looks like a real rook request object
- Testing: Tests
  With all of the setup work done (at least we only need to do that once)
  we will finally write tests to address the three types identified
  earlier in the article. We identified three scenarios for JSON we might
  receive, so we can go ahead and stick those in a data folder within our
  test directory.
