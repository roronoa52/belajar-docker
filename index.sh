#  Melihat image yang terinstal pada docker
docker image ls

# instal image
docker image pull namaimage:tag

# uninstall image
docker image rm namaimage:tag

# melihat semua container yang berjalan atau tidak
docker container ls -a

# melihat semua container yang berjalan
docker container ls

# membuat container
docker container create --name contohredis node:lts

# menjalankan container
docker container start contohredis

# menghentikan container
docker container stop contohredis

# menghapus container
docker container rm contohredis

# untuk melihat log pada container
docker container logs contohredis

# untuk melihat log pada container tetapi dengan ditunggu
docker container logs -f contohredis

# Execute image pada container
# Pertama masuk dulu ke container menggunakan program bash script yaitu:
docker container exec -i -t contohredis /bin/bash
# setelah itu jalankan image nya, sebagai contoh menjalankan redis
redis-cli
set hello "world"
get hello
# jika ingin keluar bisa menggunakan exit
exit

# cara mengakses image pada container dengan cara menggunakan port forwarding
docker container create --name contohxampp --publish 9000:80 tomsik68/xampp

# Menambahkan environment variable
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME:root --env MONGO_INITDB_ROOT_PASSWORD:example mongo:latest

# Melihat status pada container
docker container stats

# Memberikan limit pada container
docker container create --name smallnginx --publish 8081:80 --memory 100m --cpus 0.5 nginx:latest

# Bind Mounts
# yaitu melakukan mounting atau sharing file atau folder yang terdapat di sistem host ke container
docker container create --name mongodata --mount "type=bind,source=/Users/khannedy/mongo-data,destination=/data/db" --publish 27018:27017 --memory 100m --cpus 0.5 --env MONGO_INITDB_ROOT_USERNAME:root --env MONGO_INITDB_ROOT_PASSWORD:example mongo:latest

# Melihat Volume
docker volume ls

# Membuat Volume
docker volume create mongovolume

# Menghapus volume
docker volume rm mongovolume

# Menggunakan Container Volume
# Membuat volume
docker volume create mongodata
# Menghubungkan volume ke container
docker container create --name mongodata --mount "type=volume,source=mongodata,destination=/data/db" --publish 27019:27017 --env MONGO_INITDB_ROOT_USERNAME:root --env MONGO_INITDB_ROOT_PASSWORD:example mongo:latest

# Melihat Network
docker network ls

# Membuat Network
docker network create --driver bridge contohnetwork

# Menghapus Network
docker network rm contohnetwork

# Menghubungkan antar container menggunakan network
# pertama buat network
docker network --driver bridge mongonetwork
# kedua buat container mongodb
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME:root --env MONGO_INITDB_ROOT_PASSWORD:example mongo:latest
# ketiga pull mongo-express, karena ingin melihat gui mongodb menggunakan mongoexpress
docker image pull mongo-express:latest
# keempat hubungkan mongo express ke mongonetwork
docker container create --name mongoexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGO_URL=mongodb://root:example@mongodb:27017/
# terakhir start container mongodb dan juga mongo express
docker container start mongodb
docker container start mongoexpress

# Untuk melihat informasi secara detail baik untuk volume, network, image dan container
docker image inspect node

# Untuk menghapus hal yang tidak di gunakan lagi seperti stop container dll
docker container prune


//////////////////////////////////////////////////////////////////////////////////////
DockerFile

#build dockerfile
Docker build -t roronoa52/nama_aplikasi:version folder
contoh: docker buid -t roronoa52/from:1.0.0 from

# RUN merupakan perintah yang dijalankan ketika pada saat build image saja, ketika sudah dibuatkan kontainer, run tidak dijalankan lagi
RUN mkdir hello

# progess berguna untuk menampilkan proses build
Docker build -t roronoa52/nama_aplikasi:version folder --progress=plain

# --no-cache berguna untuk supaya tidak menggunakan cache
Docker build -t roronoa52/nama_aplikasi:version folder --no-cache

