UTILS = $(shell find * -maxdepth 0 -type d)

.PHONY: $(UTILS) all

all: $(UTILS)

$(UTILS):
	@echo -e 'Installing \033[0;32m$@ \033[0;0m'
	pacman -Qq | grep -qw `cat ./$@/reqs` || pacman -S `cat ./$@/reqs`
	rm -f /usr/bin/$@
	rm -f /usr/share/applications/$@.desktop
	cp ./$@/$@ /usr/bin/
	cp ./$@/$@.desktop /usr/share/applications/
	@echo
