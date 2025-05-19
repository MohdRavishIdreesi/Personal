# to valiadte the docker-compose file
docker-compose config
# to build and run the containers
docker-compose up -d --build
# to stop and delete the containers
docker-compose down

# login to mysql container
docker-compose exec db bash
    mysql -u root -p
