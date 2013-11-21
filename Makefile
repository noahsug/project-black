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
deploy-init:
	-git branch gh-pages
	git push origin gh-pages
	git checkout gh-pages
	printf "all: clean\n	cp bin/* .\n	rm *.map\n	git checkout master assets\n	mv assets/* .\n	rm -rf assets\n	python fix_paths.py\n\nclean:	rm *.png\n	rm *.js\n	rm *.html\n" | cat > Makefile
	git add Makefile
	git commit -am "initializing production content"
	git push --set-upstream origin gh-pages
	git checkout master

# Deploy the game to the github page: http://noahsug.github.io/my-project/
# Important! Call 'make deploy-init' before running this.
deploy: prod
	git checkout gh-pages
	make
	git commit -am "updated game"
	git push
	git checkout master
