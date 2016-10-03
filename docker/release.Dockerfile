FROM grails-sample:latest

# Create App Directory
RUN mkdir /app

# Set Workdir
WORKDIR /app

# copy the app code
COPY . .

RUN gradle clean build -x test

# Set Default Behavior
ENTRYPOINT grails run-app