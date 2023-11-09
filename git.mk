.PHONY: help clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: vendor/git/git
	make -C $< prefix=/usr/local all

install: vendor/git/git
	make -C $< prefix=/usr/local install

vendor/git/git: vendor/git/git.zip
	unzip $< -d vendor
	mv vendor/git-2.29.2 $@

vendor/git/git.zip: vendor
	curl -L --create-dirs https://github.com/git/git/archive/v2.29.2.zip -o $@

vendor:
	[ -d $@ ] || mkdir $@

clean:
	rm -rf vendor
