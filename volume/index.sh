# how to run
docker build -t roronoa52/volume volume

docker image inspect roronoa52/volume volume

docker container create --name volume --env APP_PORT=3000 -p 3000:3000 roronoa52/volume

docker container inspect volume

docker container start volume

docker container logs volume