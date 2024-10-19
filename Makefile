install:
	stow -S . -t $(HOME)
uninstall:
	stow -D . -t $(HOME)
