HOME=/home/mesuutt

init: 
	git submodule init
	git submodule update

install: init zsh  vim others bin scripts
	echo -e "\n\n 'make clean' if everything is fine\n"

clean: clean-bash clean-zsh clean-i3 clean-scripts

bash: backup-bash
	ln -svf `pwd`/bash/bashrc $(HOME)/.bashrc
	ln -svf `pwd`/bash/bash_profile $(HOME)/.bash_profile
	ln -svf `pwd`/bash/bash_aliases $(HOME)/.bash_aliases

backup-bash:
	-mv $(HOME)/.bashrc{,.old}
	-mv $(HOME)/.bash_profile{,.old}
	-mv $(HOME)/.bash_aliases{,.old}

clean-bash:
	-rm -ri $(HOME)/.bashrc.old
	-rm -ri $(HOME)/.bash_profile.old
	-rm -ri $(HOME)/.bash_aliases.old
	

zsh: backup-zsh
	ln -svf `pwd`/zsh/zshrc $(HOME)/.zshrc
	ln -svf `pwd`/zsh/zshenv $(HOME)/.zshenv
	ln -svf `pwd`/zsh/oh-my-zsh $(HOME)/.oh-my-zsh
	ln -svf `pwd`/zsh/zsh_aliases $(HOME)/.zsh_aliases

backup-zsh:
	-mv $(HOME)/.zshrc{,.old}
	-mv $(HOME)/.zshenv{,.old}
	-mv $(HOME)/.zsh_aliases{,.old}

clean-zsh:
	-rm -ri $(HOME)/.zshrc.old
	-rm -ri $(HOME)/.zshenv.old
	-rm -ri $(HOME)/.zsh_aliases.old

vim:
	ln -svf vim/vim $(HOME)/.vim
	ln -svf vim/vimrc $(HOME)/.vimrc
	

bin:
	-mkdir $(HOME)/.bin
	ln -svf bin $(HOME)/.bin

i3: backup-i3
	ln -svf `pwd`/i3 $(HOME)/.i3
	ln -svf `pwd`/i3/i3status.conf $(HOME)/.i3status.conf

backup-i3:
	-mv $(HOME)/.i3{,_old}
	-mv $(HOME)/.i3status.conf{,.old}

clean-i3:
	-rm -ri $(HOME)/.i3_old
	-rm -ri $(HOME)/.i3status.conf.old
	

scripts:
	-mv $(HOME)/.scripts{,_old}
	ln -svf `pwd`/scripts $(HOME)/.scripts

clean-scripts:
	-rm -ri $(HOME)/.scripts_old

others:
	for i in `ls dots/`; do ln -svf `pwd`/dots/$$i $(HOME)/.$$i ; done

