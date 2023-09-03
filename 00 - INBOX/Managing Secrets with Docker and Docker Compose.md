```yaml
version: "3"
services:
  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD_FILE: /run/secrets/mysql_root_password
    secrets:
      - mysql_root_password
secrets:
  mysql_root_password:
    file: password.txt
```

Let’s analyze what’s happening in this file:

- The `secrets` section defines a single secret called `mysql_root_password`.
- The secret’s value is read from `password.txt` in your working directory.
- The `mysql` service references the secret within its own `secrets` field.
- When the container starts, the contents of `password.txt` will be read and mounted to `/run/secrets/mysql_root_password` (the name of the secret) inside the container.
- The `MYSQL_ROOT_PASSWORD_FILE` environment variable instructs the official [MySQL Docker image](https://hub.docker.com/_/mysql) to read its password from the mounted file.

```dockerfile
FROM node:18 AS build
ARG NPM_AUTH_TOKEN

COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm config set @example:registry https://registry.example.com/ &&\
  npm config set -- '//registry.example.com/:_authToken' "${NPM_AUTH_TOKEN}" &&\
  npm install
```

Set the `--build-arg` flag to provide your auth token when you build the image:

```bash
$ docker build --build-arg NPM_AUTH_TOKEN=foobar -t example-image:latest .
```

Need more tips on handling your secrets? Here are three best practices to remember:

1. **.gitignore** **all files that contain secrets** – Mounting secrets into containers from local files carries the risk of those files being accidentally committed to your repository. Add paths that will contain secrets to your .gitignore file to prevent git add . from inadvertently staging sensitive values.
2. **Design your Docker images around safe secrets management** – Encourage the adoption of good secrets management practices by designing your images and applications around them. Make apps always read secrets from the filesystem, instead of environment variables, to prevent user mistakes and shortcuts.
3. **Ensure secrets are used for all sensitive values.** – Developers sometimes lack the context to decide whether a particular value needs to be treated as a secret. Address this by clearly communicating secrets requirements, including how to identify candidate values. A secret is anything that could be valuable to an attacker, or which might expose other data – secrets shouldn’t be confined to passwords and certificates.