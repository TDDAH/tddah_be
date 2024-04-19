# README

## Overview

TDDAH! introduces a new approach to learning and practicing Test-Driven Development (TDD) in Rails. Seeking to transform how developers, especially students and newcomers, perceive and engage with software testing, TDDAH! celebrates progress and milestones in TDD through achievements, making the learning process both rewarding and fun.

### Requirements

Currently the only supported repos need to meet the following requirements

- Ruby
- Rails
- SimpleCov
- GitHub

and their .gitignore fil needs to be updated with the following:
```
# Ignore SimpleCov coverage reports, but allow the index.html file.
/coverage/*
!coverage/index.html 
```
and then it needs to be pushed up to GitHub.

This will allow TDDAH! access to the index.html file to acertain whether any achievements are met.

## Backend App Info

The backend is hosted on [Heroku](https://tddah-be-39c5a52e8b65.herokuapp.com/) and uses:

- Ruby 3.2
- Rails 7.1
- PostgreSQL

## Frontend App Info

The user interacts with the frontend app, also hosted on Heroku: [TDDAH!](https://tddah-fe-511fa9211749.herokuapp.com/)

More information regarding the frontend can be found on GitHub: [tddah-fe](https://github.com/TDDAH/tddah-fe)

## Open Source

### Code of Conduct

TDDAH! embraces the Contributor Covenant Code of Conduct, which is outlined in `./CODE_OF_CONDUCT.md`

### Installation / Running the App

While not necessary for the average user, the backend can be interacted in the following manner:

1. Clone the repository
- `git clone git@github.com:TDDAH/tddah_be.git`

2. Navigate to the project directory
- `cd tddah_be`

3. Install the required gems
- `bundle install`

4. Create / Migrate the database
- `rails db:{create,migrate}`

5. Start the rails server
- `rails s`

### Testing

1. Testing (through RSpec) is achieved through the following terminal command:
- `bundle exec rspec`

## Endpoints

See `./BACKEND_CONTRACT.md`

## Database Schema

![DB SCHEMA](<Screenshot 2024-04-16 at 1.38.04 PM.png>)

__User__
- name
- email
- password
- password_confirmation
- provider
- uid

__Repo__
- owner
- name

__Achievements__
- name
- description

## Contributors

__Backend Team__
- Miranda Delaney
- Stephen Nash

__Frontend Team__
- Florenzo Bauer
- Matt Garcia

## Contributing

Contributions are welcome in the form of tips, tricks, and job offers!