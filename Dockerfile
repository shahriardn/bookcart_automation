FROM cypress/included

# Set the working directory in the Docker image
WORKDIR /app
#
## Copy files into the Docker image
COPY . /app

# Install dependencies
RUN npm install

CMD ["npm", "run", "cy:run:cloud"]
