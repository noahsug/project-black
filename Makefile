all: dev

# Run the test suit using node.js.
test:
	jasmine-node --coffee spec/

# Automatically run tests whenever a change is made.
watch:
	jasmine-node --coffee spec/ --autotest --watch . --noStack

# Same as prod, but required .js files are generated automatically.
# Note: May cause console errors due to incorrect file order.
dev:
	-rm -r bin
	mkdir bin
	coffee -cmo bin coffee
	coffee -cmo bin nodejs_web
	coffee -cmo bin vendor/atom
	cp vendor/jquery.js bin/
	cp vendor/Canvas-Sprite-Animations/sprite.min.js bin/
	python nodejs_web/populate_html.py "DEV"

# Important! Update ordered_game_files in populate_html.py before running this.
# Create bin/ with required files to run the game.
prod: dev
	python nodejs_web/populate_html.py "PROD"

# Creates the gh-pages branch, which is where the production code will live.
# Call this one time before any calls to 'make deploy' are called.
# Make sure the master branch is clean before running this (e.g run 'git stash' then 'git apply' afterwards).
deploy-first-time:
	git branch gh-pages
	git push origin gh-pages
	git checkout gh-pages
	git cp tools/gh-pages/* .
	git add *
	git commit -am "initializing production content"
	git push --set-upstream origin gh-pages
	git checkout master
	make deploy

# Deploy the game to the github page: e.g. http://noahsug.github.io/project-black/
# 'make deploy-first-time' must be called before this command can be repeatedly used.
# Make sure the master branch is clean before running this (e.g run 'git stash' then 'git apply' afterwards).
deploy: prod
	git checkout gh-pages
	make
	git commit -am "updated game"
	git push
	git checkout master
