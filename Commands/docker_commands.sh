=========================================
DOCKER INSTALLATION ON UBUNTU - ALL COMMANDS
=========================================

1. Update System
-----------------------------------------
sudo apt update
sudo apt upgrade -y


2. Install Docker
-----------------------------------------
sudo apt-get install docker.io


3. Check Docker Version
-----------------------------------------
docker --version


4. Check Docker Service Status
-----------------------------------------
sudo systemctl status docker


5. Start Docker Service
-----------------------------------------
sudo systemctl start docker


6. Enable Docker at Boot
-----------------------------------------
sudo systemctl enable docker


7. Use Docker Without sudo
-----------------------------------------
sudo usermod -aG docker $USER
newgrp docker


8. Check Running Containers
-----------------------------------------
docker ps


9. Check All Containers
-----------------------------------------
docker ps -a

10. Check Downloaded Images
-----------------------------------------
docker images

=========================================
END
=========================================

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
