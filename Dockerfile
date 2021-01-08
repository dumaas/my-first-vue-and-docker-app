# base image
FROM node:15.5

# install simple http server for static content
RUN npm install -g http-server

# set working dir
WORKDIR /code

# add '/code/node_modules/.bin' to $PATH
ENV PATH /code/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package*.json ./
RUN npm install

# copy project
COPY . /code/

CMD ["npm", "run", "serve"]
