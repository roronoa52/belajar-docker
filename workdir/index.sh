docker build -t roronoa52/workdir workdir

docker container create --name workdir -p 8080:3000 roronoa52/workdir

docker container start workdir

docker container exec -i -t workdir /bin/bash
