FROM grails-base:latest

# Set Workdir
WORKDIR /app

# copy the app code
COPY . .

RUN ./gradlew clean build -x test

# Set Default Behavior
ENTRYPOINT grails run-app