#a basic image to start from
FROM node:17-alpine3.14

# install bash
RUN apk add --no-cache --upgrade bash

# needed global packages for the project
RUN npm i -g typescript nodemon ts-node

# defines where to run the 'ENTRYPOINT' command from
WORKDIR /app

# set the default main command of the container to run 'nodemon src/index.ts'
ENTRYPOINT ["/bin/bash" , "-c" ]
CMD ["bash" ]

