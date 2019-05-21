# Vanellope

microservice to log in and sign up

**Prerequisites**
Before staring, install:
*[Docker](https://docs.docker.com/install/)

*[Docker Compose](https://docs.docker.com/compose/install/)

*[Ruby On Rails](https://guides.rubyonrails.org/v5.0/getting_started.html)

**Install the microservise**
After download the repositore you can run the next lines insade on the same folder of your the project:

For the deploy of Postgrest database:
* ```docker-compose up -d```

For the deploy of Ruby on Rails microservise:

* ```bundle install```

* ```rake db:migrate```

For run the microservise with the database:

* ```rails s```
