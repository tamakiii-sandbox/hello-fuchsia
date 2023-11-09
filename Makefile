.PHONY: help install clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	bootstrap.sh \
	bootstrap_jiri.sh

fuchsia: bootstrap.sh bootstrap_jiri.sh
	./bootstrap.sh

bootstrap.sh:
	curl -s "https://fuchsia.googlesource.com/fuchsia/+/HEAD/scripts/bootstrap?format=TEXT" | base64 --decode > $@
	chmod u+x $@

bootstrap_jiri.sh:
	curl -s "https://fuchsia.googlesource.com/jiri/+/HEAD/scripts/bootstrap_jiri?format=TEXT" | base64 --decode > $@
	chmod u+x $@

clean:
	rm -rf fuchsia
