# Gym Buddies
## Rails Server

This app was built on the Ruby on Rails framework, you can learn more about Ruby on Rails [here](https://guides.rubyonrails.org/).

## Description

Gives gym goers a place to track their workouts, check-in to a local gym, and find a gym buddy and connect with them through live messaging.

## Demonstration

You can see a video demonstration [here](https://www.youtube.com/watch?v=_eG66odazLw&feature=youtu.be)

## To run this program:

### Clone this repository and the client repository at:

Gym Buddies ReactJS Client: [https://github.com/rosspjones13/gym-buddies-client](https://github.com/rosspjones13/gym-buddies-client).<br>
Follow the steps to run the client.

### How to start the server:

To create the seeded Postgres database, follow these steps:

#### 1. `rails db:create`

#### 2. `rails db:migrate`

#### 3. `rails db:seed`

Once the database is created run the following command:

#### `rails start`

This runs the api in a local host.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

There are specific routes that are accessible to create, edit and view the api.<br>