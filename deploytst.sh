#!/bin/bash
########################################################

## Shell Script to Build Docker Image and run.   

########################################################


result=$( docker images -q apptest01reactjs )
if [[ -n "$result" ]]; then
  echo "image exists"
  docker rmi -f apptest01reactjs
else
  echo "No such image"
fi


echo "built docker images and proceeding to delete existing container"
result=$( docker ps -q -f name=apptest01reactjs )
if [[ $? -eq 0 ]]; then
  echo "Container exists"
   docker container rm -f apptest01reactjs
  echo "Deleted the existing docker container"
else
  echo "No such container"
fi

cp -a /home/francisco/estudos/azuredevops/myagent/_work/4/s/.  /home/francisco/estudos/azuredevops/myagent/_work/r3/a/

echo "build the docker image"
docker build -t apptest01reactjs .

echo "built docker images and proceeding to delete existing container"

echo "Deploying the updated container"

docker run -d -p 3000:3000 --name apptest01reactjs  apptest01reactjs

echo "Deploying the container"