FROM node:16

RUN apt-get update

RUN npm i -g typescript nodemon ts-node

WORKDIR /app

# ENTRYPOINT npm i && nodemon src/index.ts # this is working

ENTRYPOINT ["/bin/bash" , "-c" ]
CMD ["npm i && nodemon src/index.ts" ]



# ENTRYPOINT nodemon src/index.ts

#  docker build -t test .
#  docker run -itd test -v