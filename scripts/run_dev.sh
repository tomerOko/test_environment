#!/bin/sh
# run from <...>/scripts
cd ../
sudo docker build -t test_environment_image . # build
sudo chown -R $USER:$(id -gn $USER) ./* # give permmisions in order to be able to adit the files
docker container rm -f test_environment_container # remove container if allready runing
docker run -itd --name test_environment_container -p 3009:3000 -v "$(pwd)"/:/app/ test_environment_image # run the container (entrypoint in dockerfile)
sleep 2 # give the container a two seconds to boot
docker container ls --filter name=test_environment_container # make sure the container is still runing
docker logs --follow test_environment_container # connect the shell to the container's logs outpout

# open new terminal and run :
# docker container exec -it test_environment_container bash
