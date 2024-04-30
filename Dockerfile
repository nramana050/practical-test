# Use a base image for Node.js
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json  to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 3000 (assuming your Node.js application runs on this port)
EXPOSE 3000

# Set the environment variable SECRET_WORD 
ARG SECRET_WORD
ENV SECRET_WORD=${SECRET_WORD}

# Command to run the application
CMD ["node", "start"]
