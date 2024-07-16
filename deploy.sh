#!/bin/bash

# Stop the existing container
docker stop $(docker ps -q --filter ancestor=my-web-app) || true
docker rm $(docker ps -aq --filter ancestor=my-web-app) || true

# Pull the latest image from ECR
docker pull 630168034893.dkr.ecr.us-east-1.amazonaws.com/my-web-app:latest

# Run the new container
docker run -d -p 80:3000 630168034893.dkr.ecr.us-east-1.amazonaws.com/my-web-app:latest
