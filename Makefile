all: vim zsh tmux

vim:
	@echo "Copying neovim files..."
	@mkdir -p $(HOME)/.config
	@cp -raf nvim $(HOME)/.config/

bash:
	@echo "Copying bash files..."
	@cp -af bash/bashrc $(HOME)/.bashrc

zsh:
	@echo "Copying zsh files..."
	@cp -af zsh/zshrc $(HOME)/.zshrc

git:
	@echo "Copying git files..."
	@cp -af git/gitconfig $(HOME)/.gitconfig
	@cp -af git/gitignore $(HOME)/.gitignore

tmux:
	@echo "Copying tmux files..."
	@cp -af tmux/tmux.conf $(HOME)/.tmux.conf

.PHONY: all vim bash zsh git tmux
