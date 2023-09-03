---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://github.com/trussworks/Engineering-Playbook/tree/main/docs/developing/healthcheck
Tags: ["#Type/Highlight/Article"]
Aliases: ["Overview", "Overview"]
---
# Overview

## Metadata
- Author: [[trussworks]]
- Full Title: Overview
- Category: #Type/Highlight/Article
- URL: https://github.com/trussworks/Engineering-Playbook/tree/main/docs/developing/healthcheck

## Highlights
- Health Checks ([View Highlight](https://read.readwise.io/read/01gvf508vt3r3b2pvryt5tvs5v))
- In modern API services, it is not uncommon to build and rely upon Healthcheck endpoint(s). These endpoints are generally orthogonal to the operating business logic of the service, and are intended to be consumed by the Operators of the system (e.g. InfraSec practitioners). ([View Highlight](https://read.readwise.io/read/01gvf50c1rc0ek2pfnwaw2nfrk))
- There are many ways that Healthcheck endpoints can be used in a system: ([View Highlight](https://read.readwise.io/read/01gvf50sb2d30hp268vkzwqszr))
- Readiness - Upon startup, has my app warmed up any internal caches that are needed before it can respond to traffic? ([View Highlight](https://read.readwise.io/read/01gvf50thhkvv8x106dkcakbnj))
- Liveness - Is this app accepting and responding to traffic at all? ([View Highlight](https://read.readwise.io/read/01gvf50vqtsyatx5sydqyfqxc6))
- Versioning - Is the verison of code that is deployed what it is expected to be? ([View Highlight](https://read.readwise.io/read/01gvf50x0qk54p7mns9b98ckfm))
- Reachability - Can a client reach the service over the network? ([View Highlight](https://read.readwise.io/read/01gvf50y6y42hqt3n997cs29gm))
- Catalog - What are the external dependencies to which this app connects? ([View Highlight](https://read.readwise.io/read/01gvf50zdktkq4ph5bpt120v14))
- Connectivity - Can the app connect to its external dependencies successfully? ([View Highlight](https://read.readwise.io/read/01gvf51189g4zm5r57jrfrp9yg))
- Quality - Does this endpoint do all its work and respond in a timely manner? ([View Highlight](https://read.readwise.io/read/01gvf512f4dkqwaw2gnxvmxz1a))
- Many apps will try to achieve their subset of the above goals via a single endpoint, but as apps grow in sophistication it is not unheard of to tease those responsibilities out to separate endpoints. ([View Highlight](https://read.readwise.io/read/01gvf5179y6ajp3pxsrw6bhges))
- Security ([View Highlight](https://read.readwise.io/read/01gvf51b7fte7xdksn5dxpys7y))
- Frequently healthcheck endpoints are agnostic about authentication and authorization, meaning anyone that can reach the service via the network can access these endpoints. ([View Highlight](https://read.readwise.io/read/01gvf51k4afc128xyvqaxbstyh))
- Having heathcheck endpoints be un-authenticated implies several other considerations: ([View Highlight](https://read.readwise.io/read/01gvf51n7rtjyxtqqsnfdpsqen))
- Any information available in the healthcheck should not be confidential, nor should the information be able to be (ab)used to jeopardize the smooth running of the service. ([View Highlight](https://read.readwise.io/read/01gvf51pekza2n6s9z1rbj9qzv))
- Unsecured healthchecks could open up the system or its checked dependencies to Denial of Service attacks. This may be mitigated by adding some level of caching in the healthchecks. ([View Highlight](https://read.readwise.io/read/01gvf51r3hvdyehrg8get6nr4t))
- One possible technique for lowering risk is to isolate operational endpoints to a separate port with tighter network ACLs. ([View Highlight](https://read.readwise.io/read/01gvf51spzg6pf29zkejh88q3x))
- Reliability ([View Highlight](https://read.readwise.io/read/01gvf51trgmsb99wyjx5ppcnzw))
- Particular care should be taken when using healthchecks as part of the reliability story of an app. ([View Highlight](https://read.readwise.io/read/01gvf51x44mzygbbg7kq66521j))
- Prof von Neuman is credited with the concept of "synthesis of reliable organisms from unreliable components". He showed that the math works out as such: if my app is serially dependent on 3 other services that are each at 97% reliable, my app can be no more than ~91% (0.97 x 0.97 x 0.97) reliable. This means that if an app's healthcheck is setup to fail when any of its dependencies have failed, this has significantly limited the upper bound of the apps reliability. ([View Highlight](https://read.readwise.io/read/01gvf520fakq6p8cd0qn7r4wre))
- Sometimes an app's reliability really is limited by a dependency, e.g. a database connection. If every single endpoint and functionality in an app requires interaction with the app's database, then it is reasonable to call your app fully inoperable when the database connection is not functioning. ([View Highlight](https://read.readwise.io/read/01gvf528pehtyttr3ygsqnvf4m))
- However, if only a subset of the app's functionality is impacted by an unreliabile dependency, it may be better to handle that instability at runtime, rather than declaring the whole app down. Consider the following example: if only one (out of many) of an app's functionalities depend on sending email, the app should maybe not be considered wholly down if the email service is unreachable; it would be better to handle errors from interacting with the email service gracefully, or possibly even using a technique like feature flagging to turn off any attempts to use that functionality until the service is back in service. ([View Highlight](https://read.readwise.io/read/01gvf52f5bcmbr8v1wmhktb1zd))
- Healthchecks in Deployment Pipelines ([View Highlight](https://read.readwise.io/read/01gvf52hj4gmjmwa247n5xdvpf))
- It is not uncommon to see teams utilize an app's healthcheck endpoint on the critical path of a deployment pipeline, however this should be evaluated for unintended consequences. ([View Highlight](https://read.readwise.io/read/01gvf52k618zkgczcjs2ssf18a))
- In modern software engineering, automated deployments are a critical feature of a software system, facilitating the ability to safely and incrementally improve the quality of a running app. ([View Highlight](https://read.readwise.io/read/01gvf52pcc59tsmyh2ykpyd4ph))
- Again, consider the app example from above that uses an email sending service for one feature: should the external service instability be able to jeopardize the ability to roll out new code? Perhaps the new code for deployment is useful for diagnosing the issue or is intended to temporarily turn off the offending sending of emails: blocking roll out makes remediation of the issue harder rather than safer. ([View Highlight](https://read.readwise.io/read/01gvf52qxa7xvs9x3kmmh3yqz4))
