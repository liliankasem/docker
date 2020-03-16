# start with specifying our base image
FROM node:13

# set a directory for the app
WORKDIR /usr/src/app

# copy all the files from the app folder to the container
COPY ./app .

# install dependencies
RUN npm install

# tell the port number the container should expose
EXPOSE 8080

# run the command
CMD ["node", "app.js"]
