all: dev

# Deploy the game to the github page: http://noahsug.github.io/my-project/
# Note: You must create a gh-pages branch before running this command.
deploy: prod
	git checkout gh-pages
	make
	git commit -am "updated game"
	git push
	git checkout master

# Important! Update ordered_game_files in populate_html.py before running this.
# Create bin/ with required files to run the game.
prod: dev
	python nodejs_web/populate_html.py "PROD"

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

# Run the test suit using node.js.
test:
	jasmine-node --coffee spec/

# Automatically run tests whenever a change is made.
watch:
	jasmine-node --coffee spec/ --autotest --watch . --noStack
