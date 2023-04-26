# FIRST PHASE
# Specify a base image con un tag "builder"
FROM node:16-alpine as builder

# Move to a folder to install and copy my files
WORKDIR '/app'

# Install some dependencies
COPY package.json .
RUN npm install
COPY . .

# Execute a command
RUN npm run build

# SECOND PHASE
FROM nginx

#COPY SOMETHING FROM FIRST PHASE (/app/build) TO DESTINATION (/usr/share/nginx/html)
COPY --from=builder /app/build /usr/share/nginx/html
