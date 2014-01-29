HOME=/home/mesuutt

init: 
	git submodule init
	git submodule update

install: init install-zsh  install-vim \
		 install-other-dots install-bin install-i3

install-bash:
	-mv $(HOME)/.bashrc{,.old}
	-mv $(HOME)/.bash_profile{,.old}
	-mv $(HOME)/.bash_aliases{,.old}
	ln -svf `pwd`/bash/bashrc $(HOME)/.bashrc
	ln -svf `pwd`/bash/bash_profile $(HOME)/.bash_profile
	ln -svf `pwd`/bash/bash_aliases $(HOME)/.bash_aliases


install-zsh:
	-mv $(HOME)/.zshrc{,.old}
	-mv $(HOME)/.zshenv{,.old}
	ln -svf `pwd`/zsh/zshrc $(HOME)/.zshrc
	ln -svf `pwd`/zsh/zshenv $(HOME)/.zshenv
	ln -svf `pwd`/zsh/oh-my-zsh $(HOME)/.oh-my-zsh


install-bin:
	-mkdir $(HOME)/.bin
	ln -svf bin $(HOME)/.bin

install-i3:
	-mv $(HOME)/.i3{,.old}
	-mv $(HOME)/.i3status.conf{,.old}
	ln -svf `pwd`/i3 $(HOME)/.i3
	ln -svf `pwd`/i3/i3status.conf $(HOME)/.i3status.conf


install-other-dots:
	for i in `ls dots/`; do ln -svf `pwd`/dots/$$i $(HOME)/.$$i ; done

install-vim:
	ln -svf vim/vim $(HOME)/.vim
	ln -svf vim/vimrc $(HOME)/.vimrc

clean:
	-unlink $(HOME)/.bashrc.old
	-unlink $(HOME)/.bash_profile.old
	-unlink $(HOME)/.bash_aliases.old
	-unlink $(HOME)/.zshrc.old
	-unlink $(HOME)/.zshenv.old
	-unlink $(HOME)/.i3.old
	-unlink $(HOME)/.i3status.conf.old
