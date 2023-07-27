#!/bin/bash

#!/bin/bash

sudo apt-get update 
sudo apt-get upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
service docker start
service docker status
docker --version


                       [OR]


sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker 
docker --version

#SonarQube
docker stop sonarqube
docker rm sonarqube
  
#PostgreSQL
docker stop postgres
docker rm postgres


docker network rm sonarqube_network

docker network create sonarqube_network

docker run --name postgres --restart=always -e POSTGRES_USER=root -e POSTGRES_PASSWORD=Mypass12345 -p 5432:5432 --network sonarqube_network -d postgres

docker run -d --name sonarqube --restart=always -p 9000:9000 -e sonar.jdbc.url=jdbc:postgresql://postgres/postgres -e sonar.jdbc.username=root -e sonar.jdbc.password=Mypass12345 --network sonarqube_network sonarqube

docker update --restart=always [container id or container name]

http://localhost:9000 or http://your-ip4-address:9000
 

username: admin
password: admin


