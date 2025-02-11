# Use an official Node runtime as the base image with the specified version
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install && npm install remark remark-html gray-matter date-fns

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Set environment variable
ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

# Start the application
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = 'production' ]; then npm run start; else npm run dev; fi"]
