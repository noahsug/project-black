# [Project Black](http://noahsug.github.io/project-black/)

An HTML5 game framework focused on testing quickly and often without needing the browser.

### Setup
1. Install node: http://nodejs.org/download/

2. Install coffee-script: `sudo npm install -g coffee-script`

3. Install jasmine-node: `sudo npm install -g jasmine-node`

### Unit testing
Run `make test` to run tests once or `make watch` to run on every change.

### Manual testing
Run `make dev` and then open **bin/main.html** in your browser of choice.

### Deploy
Update `ordered_game_files` in **populate_html.py**.

Run `make prod` and then open **bin/main.html** to make sure your production build is working correctly.

Run `make deploy-first-time` if this is your first time deploying, 
otherwise run `make deploy` to deploy the game to the github page website
(e.g. http://noahsug.github.io/project-black/ for this project).
