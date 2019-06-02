# Vanellope

Microservice to log in and sign up

**Prerequisites**

Before staring, install:

*[Docker](https://docs.docker.com/install/)

*[Docker Compose](https://docs.docker.com/compose/install/)


**Install the microservice and database**
After download the repository you must to run the next lines(maybe you need root permissions) inside on the same folder of your the project for run it:

For build the database and microservice inside of respective docker containers:
* ```docker-compose build```

For the deploy the docker containers:

* ```docker-compose up```

Vanellope will run into the localhost:3001

For stop the docker containers:

* ```Ctrl + c```
* ```docker-compose down```

Read the docker-compose.yml for modification the start of the database.

For more information about methods you can see the api.yml.
