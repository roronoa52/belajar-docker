# how to run
docker build -t roronoa52/env env

docker image inspect roronoa52/env env

docker container create --name env --env APP_PORT=3000 -p 3000:3000 roronoa52/env

docker container start env

docker container logs env