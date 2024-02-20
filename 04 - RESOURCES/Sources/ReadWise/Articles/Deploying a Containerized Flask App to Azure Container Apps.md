---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: http://blog.pamelafox.org/2022/09/deploying-containerized-flask-app-to.html?m=1
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Deploying a Containerized Flask App to Azure Container Apps
  - Deploying a Containerized Flask App to Azure Container Apps
---
# Deploying a Containerized Flask App to Azure Container Apps

## Metadata
- Author: [[Pamela Fox]]
- Full Title: Deploying a Containerized Flask App to Azure Container Apps
- Category: #Type/Highlight/Article
- URL: http://blog.pamelafox.org/2022/09/deploying-containerized-flask-app-to.html?m=1

## Highlights
- A Docker **image** is a multi-layered environment that is exactly the environment your app thrives in, such as a Linux OS with Python 3.9 and Flask installed. You can also think of an image as a snapshot or a template. ([View Highlight](https://read.readwise.io/read/01gvf53vc6ervrsb3gptq0ecj8))
- A Docker **container** is an instance of an image, which could run locally on your machine or in the cloud. ([View Highlight](https://read.readwise.io/read/01gvf53x6krbes39xytaz6r00m))
- A **registry** is a place to host images. There are cloud hosted registries like [DockerHub](https://hub.docker.com/) and [Azure Container Registry](https://azure.microsoft.com/en-us/products/container-registry/). You can **pull** images down from those registries, or **push** images up to them. ([View Highlight](https://read.readwise.io/read/01gvf53zasa1ft49vmw21svez7))
- Build an image of the Flask application locally and confirm it works when containerized. ([View Highlight](https://read.readwise.io/read/01gvf54317m65xkwqeede278hy))
- Push the image to the Azure Container Registry. ([View Highlight](https://read.readwise.io/read/01gvf5449byzf9cz2h1nsg0stt))
- Run an Azure Container App for that image. ([View Highlight](https://read.readwise.io/read/01gvf545h6t0y2kg30kx8x99cb))
- Flask's [development server](https://flask.palletsprojects.com/en/2.2.x/deploying/) is *not* suitable for production, so I brought in the [Gunicorn server](https://gunicorn.org/) as a requirement in `requirements.txt`: ([View Highlight](https://read.readwise.io/read/01gvf54azryc5e01wxjq34czn0))
- I put [Gunicorn settings](https://docs.gunicorn.org/en/stable/settings.html#settings) in `gunicorn_config.py`: ([View Highlight](https://read.readwise.io/read/01gvf54erd0549txzvx55tq23g))
- That file tells Docker to start from a base image which has python 3.9.13 installed, create a `/code` directory, install the package requirements, copy the code into the directory, expose port 5000 (Flask's default port, and then finally use Gunicorn run the Flask application.. ([View Highlight](https://read.readwise.io/read/01gvf55dh5rh0wjg79ek45xyay))
- I also added a `.dockerignore` file to make sure Docker doesn't copy over unneeded files: ([View Highlight](https://read.readwise.io/read/01gvf55f7nyv33b1k48gfbbq4g))
- However, a much faster way to do it is with the `az acr build` command, which uploads the code to cloud and builds it there: ([View Highlight](https://read.readwise.io/read/01gvf5787ex4m9m8nshra64ax3))
- ⏱ The `docker buildx` command took ~ 10 minutes, whereas the `az acr build` command took only a minute. Nice! ([View Highlight](https://read.readwise.io/read/01gvf57dra7wqyt65v9vx7b3g4))
- I upgraded the extension and registered the necessary providers: ([View Highlight](https://read.readwise.io/read/01gvf58j5fefby7pwf013re88k))
- az extension add --name containerapp --upgrade az provider register --namespace Microsoft.App az provider register --namespace Microsoft.OperationalInsights ([View Highlight](https://read.readwise.io/read/01gvf58g7tt5m73gh8g3dcnyq4))
- Then I created an [environment](https://learn.microsoft.com/en-us/azure/container-apps/environment) for the container app: ([View Highlight](https://read.readwise.io/read/01gvf58n4sz8r22zhtxz8hz8vh))
- az containerapp env create --name flask-container-environment \ --resource-group flask-container-apps --location eastus ([View Highlight](https://read.readwise.io/read/01gvf58rgtqg29b6k6yv5bk4tb))
- Next, I generated credentials so that the command line tool could log in to my registry: ([View Highlight](https://read.readwise.io/read/01gvf58x3jt4e2h043t18tr6d2))
- az acr credential show --name pamelascontainerregistry ([View Highlight](https://read.readwise.io/read/01gvf59tcb1m5h9a9evac252w9))
- Finally, I created the container app: ([View Highlight](https://read.readwise.io/read/01gvf59ysgd4ms343xwc6r0qjd))
- az containerapp create --name my-container-app \ --resource-group flask-container-apps \ --image pamelascontainerregistry.azurecr.io/flask-demo:latest \ --environment flask-container-environment \ --registry-server pamelascontainerregistry.azurecr.io \ --registry-username pamelascontainerregistry \ --registry-password $REGISTRY_PASSWORD \ --ingress external \ --target-port 5000 ([View Highlight](https://read.readwise.io/read/01gvf5a3s5b4hnrger32c8thpp))
- If I make any Flask code updates, all I need to do is re-build the image and tell the container app to update: ([View Highlight](https://read.readwise.io/read/01gvf5afqvq33h1h4wxxmtn3qt))
- az acr build --platform linux/amd64 \ -t pamelascontainerregistry.azurecr.io/flask-demo:latest \ -r pamelascontainerregistry . az containerapp update --name my-container-app \ --resource-group my-container-apps \ --image pamelascontainerregistry.azurecr.io/flask-demo:latest ([View Highlight](https://read.readwise.io/read/01gvf5ame3pbpj13wgqbf3czn0))
