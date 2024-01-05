#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y 
sudo apt-get install fontconfig openjdk-11-jre -y 

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install jenkins -y
service jenkins start
service jenkins enable
service jenkins status
java -version
jenkins --version

cat /var/lib/jenkins/secrets/initialAdminPassword


linux
======


sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install java -y
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
sudo systemctl daemon-reload
cat /var/lib/jenkins/secrets/initialAdminPassword
