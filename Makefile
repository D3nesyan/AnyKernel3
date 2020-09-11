NAME ?= MeowKernel

VERSION ?= Snapshot

DATE := $(shell date +'%m%d-%H%M')

ZIP := $(NAME)-$(VERSION)-$(DATE).zip

EXCLUDE := Makefile README.md *.git* "$(NAME)-"*.zip* .gitignore LICENSE

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@echo "Done."
