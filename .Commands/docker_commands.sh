# To remove the permission denied error when running docker commands
sudo usermod -aG docker $USER
newgrp docker

# create network
docker network create --driver bridge notes-app-network

#create volume
docker volume create notes-app-volume

# setup mysql
# pull docker mysql image
docker pull mysql:8
# run mysql container
docker run -d --name mysql --network notes-app-network -e MYSQL_ROOT_PASSWORD=rootpass -e MYSQL_DATABASE=notes_app -v "path/to/your/init.sql:/docker-entrypoint-initdb.d/init.sql" -p 3306:3306 mysql:8
# validate mysql container
# login to the container
docker exec -it mysql bash
docker exec -it mysql mysql -uroot -p -e "USE notes_app; SHOW TABLES;"

# setup manual docker file
# create image from docker file
docker build -t notes-backend .
# create container from image
docker run --name notes-backend -d -p 5000:5000 --network notes-app-network --env-file .env notes-backend
