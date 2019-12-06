# Instructions

Build the docker image

    docker build -t codechallenge:latest -f Dockerfile .

Run the docker container

    docker run -i -d -v $(pwd):/mnt/workspace codechallenge:latest

Enter the Container

    docker exec -it $(docker ps | grep codechallenge:latest | awk '{print $1}') bash

Run the application within docker container    

    ruby app.rb
