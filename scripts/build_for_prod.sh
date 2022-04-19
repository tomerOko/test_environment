
#!/bin/sh
# run from <...>/scripts
cd ../
sudo docker build -t test_environment_image . # build TODO: make the build conditional on flag --rebuild
sudo chown -R $USER:$(id -gn $USER) ./* # give permmisions in order to be able to adit the files
docker container rm -f prod_build_container # remove container if allready runing
docker run -itd --name prod_build_container -v "$(pwd)"/:/app/ test_environment_image "npm i && tsc" # run the container (entrypoint in dockerfile)
sleep 1 # give the container a second to boot
docker container ls --filter name=prod_build_container # make sure the container is actualy runing
docker logs --follow prod_build_container # connect the shell to the container's logs outpout
