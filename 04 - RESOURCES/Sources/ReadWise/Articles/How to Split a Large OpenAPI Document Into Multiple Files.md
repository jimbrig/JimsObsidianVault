---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://davidgarcia.dev/posts/how-to-split-open-api-spec-into-multiple-files/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - How to Split a Large OpenAPI Document Into Multiple Files
  - How to Split a Large OpenAPI Document Into Multiple Files
---
# How to Split a Large OpenAPI Document Into Multiple Files

## Metadata
- Author: [[davidgarcia.dev]]
- Full Title: How to Split a Large OpenAPI Document Into Multiple Files
- Category: #Type/Highlight/Article
- URL: https://davidgarcia.dev/posts/how-to-split-open-api-spec-into-multiple-files/

## Highlights
- So, you have written a large OpenAPI spec. At this point, you may have considered making the document modular by dividing it into smaller separate files. ([View Highlight](https://read.readwise.io/read/01gvf5gfwjqwn9h04465g36aj6))
- Step 1 - Reusing responses ([View Highlight](https://read.readwise.io/read/01gvf5hbq6y55wjy2j0w2yjpmm))
- It’s easier to start splitting an OpenAPI document if you’re already reusing schemas. ([View Highlight](https://read.readwise.io/read/01gvf5hg2183fer4bbsrzd2vnx))
- Imagine that you need to document two endpoints: one to retrieve a group of pets, and a second one to retrieve a single pet. Consequently, you notice that you have to define the response object `Pet` twice. ([View Highlight](https://read.readwise.io/read/01gvf5htxyf82hv499hdyb0pvq))
- Following this example, you define a separate schema named `Pet` under the section `component/schemas`, and reuse the object in both endpoints. ([View Highlight](https://read.readwise.io/read/01gvf5j1r8e49w7evxzns4rmvg))
- The keyword `$ref` does the trick. In general, a keyword allows us to reference other definitions within the same document. ([View Highlight](https://read.readwise.io/read/01gvf5j46sgbcjd2bdvakq56qz))
- Step 2 - Reusing parameters ([View Highlight](https://read.readwise.io/read/01gvf5jb2hrfzwkthx150ax2y6))
- Now that you're comfortable reusing schemas in the same file let's reuse the parameter `petId` from the operation `showPetById`. ([View Highlight](https://read.readwise.io/read/01gvf5jfsmrd0hn78gd4pe4qme))
- Step 3 - Importing definitions from a separate file ([View Highlight](https://read.readwise.io/read/01gvf5jrkqzwgpcye9khzf4f92))
- Do you remember the keyword we’ve been using to reuse content? `$ref` not only allows us to import objects from the same file but from other sources like a separate file or a remote URL as well. ([View Highlight](https://read.readwise.io/read/01gvf5k5p04has9jpw05rh8kn8))
- Create a new file named `schemas/Pet.yaml` for the `Pet` schema. Then, move the definition to the new file. Here's how the resulting file should look like: ([View Highlight](https://read.readwise.io/read/01gvf5ka2ma0r9b5n2e6re1cw0))
- Now, point `$ref` to the new file's location. ([View Highlight](https://read.readwise.io/read/01gvf5khtr0y0v0dhdxhvmhd5f))
- Finally, do the same for the other objects that you might want to split into separate files. ([View Highlight](https://read.readwise.io/read/01gvf5km8s9cx938r3mfj3m1w9))
- Step 4 - Moving resources to a separate file ([View Highlight](https://read.readwise.io/read/01gvf5knkrtw8dyvb5ym30njj9))
- Until now, we’ve seen how to organize response objects and parameters. However, if the document defines several endpoints, you’ll likely still have a large file that's difficult to maintain. Next, we’ll organize the resource paths into multiple files. ([View Highlight](https://read.readwise.io/read/01gvf5mcfzpt1zhscfacnjgr49))
- For example, you could create the file `path/pet.yaml`. This file should define all the available operations, which their associated parameters and responses for the endpoint `/pets/{petId}`: ([View Highlight](https://read.readwise.io/read/01gvf5m0r09aj2vrck9nx919mr))
- To achieve this, create the following `_index.yaml` files: ([View Highlight](https://read.readwise.io/read/01gvf5n1bjay4bfw4z961pdj5d))
- • `parameters/_index.yaml`
  • `schemas/_index.yaml`
  • `responses/_index.yaml` ([View Highlight](https://read.readwise.io/read/01gvf5n8dv120m3w4s2143xjv4))
- ![](https://davidgarcia.dev/images/maroon-mango.png) ([View Highlight](https://read.readwise.io/read/01gvf5nrsq64pf3e0qrvjrabfm))
- Some of the OpenAPI based tools support only a single file as an input. To continue using the spec with those tools, we’ll compile all the different files we’ve created with the command-line tool [swagger-cli](https://github.com/APIDevTools/swagger-cli). ([View Highlight](https://read.readwise.io/read/01gvf5p69hd4cj6vkvh64hgpcw))
- Some of the OpenAPI based tools support only a single file as an input. To continue using the spec with those tools, we’ll compile all the different files we’ve created with the command-line tool [swagger-cli](https://github.com/APIDevTools/swagger-cli). ([View Highlight](https://read.readwise.io/read/01gvf5p757gvh65ak8vyvamrhy))
- 1. Open a new terminal. Then, install the package `swagger-cli` globally: ([View Highlight](https://read.readwise.io/read/01gvf5pcqk4qpf3qh954sz1mvk))
- 2. Run the command to merge all the files into one: ([View Highlight](https://read.readwise.io/read/01gvf5pe5y0d2qxwmq4kgqqzem))
- 3. If everything goes well, you should see a single OpenAPI file compiled under the `_build` directory. ([View Highlight](https://read.readwise.io/read/01gvf5pfms86rjvavjw7mj1g0q))
