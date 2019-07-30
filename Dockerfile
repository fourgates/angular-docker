# base image
FROM node:12.2.0

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
# TODO - figure out how to replace this
# should just have to install once
RUN npm install
RUN npm install -g @angular/cli@1.6.5

# add app
COPY . /app

# start app
CMD ng serve --host 0.0.0.0