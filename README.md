# strichliste-docker-compose

Docker images and a Compose stack for [Strichliste](https://github.com/strichliste), a tally-sheet app.

## Setup

Download the [compose.yaml](https://raw.githubusercontent.com/m-ober/strichliste-docker-compose/refs/heads/main/compose.yaml)
from this repository.

Create an `.env` file:

```
APP_SECRET=longrandomstring

# The following are optional
PORT=8081
TZ=Europe/Berlin
CORS_ALLOW_ORIGIN=example.org

# Pin the version
BACKEND_VER=2.0.1
FRONTEND_VER=2.0.0
```

Then run:

```
docker compose up
```

Note: Migrations will be applied automatically if the backend version is updated.

## License

This repository (Dockerfiles, workflows, compose) is MIT-licensed. The upstream Strichliste projects are MIT-licensed by their respective authors; see their repositories for details.
