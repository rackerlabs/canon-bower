REF =

default: tmp
	@rm -rf dist fonts images javascripts stylesheets
	@mkdir -p dist tmp fonts images javascripts stylesheets
	@cd $< && git remote update && git checkout master && ( git branch -D build || true ) && git checkout -b build $(REF)
	@cp -rf $</lib/fonts/* ./fonts
	@cp -rf $</lib/images/* ./images
	@cp -rf $</lib/javascripts/* ./javascripts
	@cp -rf $</lib/stylesheets/* ./stylesheets
	@cd $< && npm install && bower install && grunt build
	@cp -rf $</dist/* ./dist

tmp:
	@git clone https://github.com/rackerlabs/canon.git $@

.PHONY: default