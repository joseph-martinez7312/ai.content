# AI Content
  Email Generator - An application which can generate an email according to your needs

# Description
  You can generate a template while creating a content type. Then the application will use this template and replace the data which you have entered for the content.

# Models
  - Content
  - Content Type
  - Content Result

# Gems
  - bootstrap
  - figaro
  - ruby-openai

# System dependencies
  - Rails 7.0.4
  - Ruby 2.7.7
  - Docker

# Setup Instructions
  - Clone the zip
  - Run your docke-deamon
  - Run docker-compose build
  - Run docker-compose up
  - Add your environment variables in docker-compose.yml file
    - POSTGRES_HOST, POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_PORT
  - go to http://localhost:3000/
