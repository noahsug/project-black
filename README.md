# Project Black

An HTML5 game framework focused on testing quickly and often without needing the browser.

## Setup

1. Install node

http://nodejs.org/download/

2. Install coffee-script

`sudo npm install -g coffee-script`

3. Install jasmine-node

`sudo npm install -g jasmine-node`

## Development

### Unit testing
Run `make test` to run tests once or `make watch` to run on every change.

### Manual testing
Run `make` and then open **bin/main.html** in your browser of choice.

### Deploy
Run `make prod` to deploy the game to http://noahsug.github.io/my-project/