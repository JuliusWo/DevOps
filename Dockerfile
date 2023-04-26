# Use the official Node.js image as a base image
FROM node:14

# Create the application directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the application directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the application port
EXPOSE 8080

# Start the application
CMD [ "node", "server.js" ]
