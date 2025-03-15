#!/usr/bin/env bash

# Update system packages and install Node.js and npm
sudo apt update && sudo apt install -y nodejs npm

# Install pm2, which is a process manager for Node.js applications
sudo npm install -g pm2

# Stop any currently running instance of the application (ignore errors if it doesn't exist)
pm2 stop example_app

# Navigate to the application directory
cd SimpleApplication/

# Install application dependencies
npm install
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

# Start the application using pm2 with the process name "example_app"
pm2 start ./bin/www --name example_app
