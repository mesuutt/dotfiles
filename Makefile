HOME=/home/mesuutt

init: 
	git submodule init
	git submodule update

install: init zsh  vim \
		 other-dots bin i3
	echo 'run `make clean` if everything is fine'

bash:
	-mv $(HOME)/.bashrc{,.old}
	-mv $(HOME)/.bash_profile{,.old}
	-mv $(HOME)/.bash_aliases{,.old}
	ln -svf `pwd`/bash/bashrc $(HOME)/.bashrc
	ln -svf `pwd`/bash/bash_profile $(HOME)/.bash_profile
	ln -svf `pwd`/bash/bash_aliases $(HOME)/.bash_aliases


zsh:
	-mv $(HOME)/.zshrc{,.old}
	-mv $(HOME)/.zshenv{,.old}
	-mv $(HOME)/.zsh_aliases{,.old}
	ln -svf `pwd`/zsh/zshrc $(HOME)/.zshrc
	ln -svf `pwd`/zsh/zshenv $(HOME)/.zshenv
	ln -svf `pwd`/zsh/oh-my-zsh $(HOME)/.oh-my-zsh
	ln -svf `pwd`/zsh/zsh_aliases $(HOME)/.zsh_aliases

bin:
	-mkdir $(HOME)/.bin
	ln -svf bin $(HOME)/.bin

i3:
	-mv $(HOME)/.i3{,_old}
	-mv $(HOME)/.i3status.conf{,.old}
	ln -svf `pwd`/i3 $(HOME)/.i3
	ln -svf `pwd`/i3/i3status.conf $(HOME)/.i3status.conf

scripts:
	-mv $(HOME)/.scripts{,_old}
	ln -svf `pwd`/scripts $(HOME)/.scripts

other-dots:
	for i in `ls dots/`; do ln -svf `pwd`/dots/$$i $(HOME)/.$$i ; done

vim:
	ln -svf vim/vim $(HOME)/.vim
	ln -svf vim/vimrc $(HOME)/.vimrc

clean:
	-rm -ri $(HOME)/.bashrc.old
	-rm -ri $(HOME)/.bash_profile.old
	-rm -ri $(HOME)/.bash_aliases.old
	-rm -ri $(HOME)/.zshrc.old
	-rm -ri $(HOME)/.zshenv.old
	-rm -ri $(HOME)/.i3_old
	-rm -ri $(HOME)/.i3status.conf.old
	-rm -ri $(HOME)/.scripts_old
	-rm -ri $(HOME)/.zsh_aliases.old
