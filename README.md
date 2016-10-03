
# Create the docker that provide development access!

`docker build -t grails-sample:latest -f ./docker/base.Dockerfile .`

## Running docker to dev

`docker run -it --name=grails-dev -v $(pwd):/app -p 8080:8080 grails-sample`

What I did here: (based on https://grails.org/wiki/Quick%20Start)

```
grails create-app --inplace
grails generate-all org.example.Book
grails run-app
```

open `http://localhost:8080`

## Create an app image

`docker build -t grails-app:latest -f ./docker/release.Dockerfile .`

`docker run -d --name=grails-app -p 8080:8080 grails-app`

open `http://localhost:8080`
