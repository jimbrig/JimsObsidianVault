---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://auth0.com/blog/best-practices-for-flask-api-development/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Best Practices for Flask API Development", "Best Practices for Flask API Development"]
---
# Best Practices for Flask API Development

## Metadata
- Author: [[Juan Cruz Martinez]]
- Full Title: Best Practices for Flask API Development
- Category: #Type/Highlight/Article
- URL: https://auth0.com/blog/best-practices-for-flask-api-development/

## Highlights
- But which framework should you use to build your APIs with Python? It’s 100% up to you, but there are important considerations to keep in mind. After all, some of these frameworks are different, even from the ideology. ([View Highlight](https://read.readwise.io/read/01gvscz8ymzcd4f9t61vmrg6qv))
- Django is an all-inclusive framework. It provides tools and modules for handling API requests, serialization, database connections, automatic admin UI generation, and so much more. ([View Highlight](https://read.readwise.io/read/01gvsczagv1ak9mwv51b03t100))
- Flask, on the contrary, is a minimalist framework, it provides only the necessary tools, but it extends its functionality with additional libraries and frameworks. The great part is, you decide exactly what you need for your project, nothing more. ([View Highlight](https://read.readwise.io/read/01gvsczbvsnr5qavdxv03fgq88))
- FastAPI is a relatively new framework. It makes use of newer python features such as type-hints, concurrency handling (with async), and it’s super fast. ([View Highlight](https://read.readwise.io/read/01gvsczdpasz3sh6x89t4czz7x))
- I work a lot with Flask and FastAPI, and I love both. I love the flexibility and adaptability of these frameworks, and for today's article, we will be focusing on Flask. ([View Highlight](https://read.readwise.io/read/01gvsczp774612rdgy3nb7jdz1))
- Design your API endpoints with proper names and HTTP verbs ([View Highlight](https://read.readwise.io/read/01gvsczsvf65vrsp2mjstdmtv8))
- How to properly structure your application ([View Highlight](https://read.readwise.io/read/01gvsczvnr2r861s9nxq9e7yt6))
- Build your documentation from the code ([View Highlight](https://read.readwise.io/read/01gvsczyv6znyre6kxegkpstfv))
- Testing ([View Highlight](https://read.readwise.io/read/01gvsd007kbn0ndwtxqa1ngr7m))
- Design Your API Endpoints with Proper Names and HTTP Verbs ([View Highlight](https://read.readwise.io/read/01gvsd02gs7zb8yjhm5n3k7saa))
- An adequately designed API is easy and straightforward for developers to understand. By reading the [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) and HTTP verb (more on this later), a developer can pretty much have a good understanding of what to expect to happen when calling a particular method. ([View Highlight](https://read.readwise.io/read/01gvsd06ppzhnyce15ka4zpgyd))
- But how does that work? Let’s start with naming URIs. In REST, we called `Resource` to a first-level data representation. Naming these resources **consistently** throughout your API will turn out to be one of the best decisions for the long term. ([View Highlight](https://read.readwise.io/read/01gvsd081g56yayvpwk9xddrmd))
- Let’s start getting practical by modeling a simple eCommerce website with customers, orders, and a checkout process. ([View Highlight](https://read.readwise.io/read/01gvsd0q8svj7rm8qher9bb4qd))
- Our primary resource is `customers`, which is a collection of the instance `customer`. With this information, we can identify the collection resource by the URI `/customers` or a single resource by using the URI `/customers/{customerId}`. Subsequently, we can identify sub-resources such as `orders`, and we can identify them as `/customers/{customerId}/orders`, or a single order resource by `/customers/{customerId}/orders/{orderId}`. ([View Highlight](https://read.readwise.io/read/01gvsd0sa72j44h0ks14hjfmgd))
