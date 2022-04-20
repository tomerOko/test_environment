#!/bin/sh
# run from <...>/scripts
cd ../ 

# load flags from the run command (bash <script name>.sh --<flag key> <flag value>)
while getopts i:c:p:r: flag
do
    case "${flag}" in
        i) imageName=${OPTARG};;
        c) containerName=${OPTARG};;
        p) port=${OPTARG};;
        r) runCommand=${OPTARG};;
    esac
done

# assign defult vales to empty flag's variables
if [ -z "$imageName" ];then
    imageName="run_ts_image";
fi

if [ -z "$containerName" ];then
    containerName="run_ts_test_container";
fi

if [ -z "$port" ];then
    port=3006;
fi

if [ -z "$runCommand" ];then
    runCommand="";
fi

# look for arguments
for var in "$@"
do
    case "${var}" in
        no-build) noBuild=1;;
    esac
done


# dont build image only if the image already exits and 'no-build' flad was provided
if ([ -n "$(docker images -q $imageName)" ] && [ -n "$noBuild" ]);
then
    echo "image is exist and 'no-build' flag is on => not building image $imageName";
else
    sudo docker build -t $imageName . # build
fi
sudo chown -R $USER:$(id -gn $USER) ./* # give permmisions in order to be able to adit the files
docker container rm -f $containerName # remove container if allready runing
docker run -itd --name $containerName -p $port:3000 -v "$(pwd)"/:/app/ $imageName "$runCommand" # run the container (entrypoint in dockerfile)
sleep 1 # give the container a second to boot
docker container ls --filter name=$containerName # make sure the container is actualy runing
docker logs --follow $containerName # connect the shell to the container's logs outpout
