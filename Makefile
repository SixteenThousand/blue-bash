IGNORE=--ignore=Makefile
install:
	mkdir -p ${HOME}/.local/share/bash
	stow -S . -t ${HOME} ${IGNORE}
uninstall:
	stow -D . -t ${HOME} ${IGNORE}
