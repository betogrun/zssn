# ZSSN

Rails API to store information about survivors and resources during the zombie apocalipse.
I hope this nevers happens...

## Ruby version

Running on 2.3.3.

## System dependencies

Any *nix platform.

You can run our app on docker too.
```
docker-compose build
docker-compose up

```

## Setup

Run in the machine:
```
bin/setup
```
or with docker:
```
docker-compose run web bin/setup
```

to make the database creation, database migration and the database initialization.

## How to run the test suite
`rspec spec/`
