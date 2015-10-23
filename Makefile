.PHONY: all vim bashrc
all: vim bashrc

vim:
	@cp -af ./vimrc $(HOME)/.vimrc
	@mkdir -p $(HOME)/.vim
	@cp -afr ./vim/* $(HOME)/.vim

bashrc:
	@cp -af ./bashrc $(HOME)/.bashrc
