if [[ $(uname) == "Linux" ]]; then
    alias ls="ls --color"
else
    alias ls="ls -G"
fi

alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color"
alias lgrep="grep --color -n"
alias diff='colordiff'

# from bekir
alias syslog='sudo tail -F -n 25 /var/log/syslog.log | ccze -A -p syslog'
alias dmesg='dmesg | ccze -A'
alias dt='date +%H:%M:%S\ %Y-%m-%d\ %a\ %b | ccze -A'
psc () { /bin/ps $@ | ccze -A; }
tail () { /usr/bin/tail $@ | ccze -A; }
t () { /usr/bin/tail -f * | ccze -A; }
ant () { /usr/bin/ant $@ | ccze -A ; }

# Set Locale to C
alias l2c="export LANG=C; export LC_ALL=C"
alias l2tr="export LANG=tr_TR.UTF-8; export LC_ALL=tr_TR.UTF-8; export LANGUAGE=tr_TR.UTF-8; export LC_CTYPE=tr_TR.UTF-8"

# Use console instead of GUI for Emacs
alias emacs="emacs -nw"

# yaourt
alias y="yaourt"

# virsh
alias virsh="virsh -c qemu:///system"

# grep that excludes some files from the output
gr () {
    find -type f \
        ! -iwholename "*.svn*" \
        ! -iwholename "*.git*" \
        ! -iwholename "*CVS*" \
        ! -iwholename "*cache*" \
        ! -iwholename "*RCS*" \
        ! -iwholename "*/graphs/*" \
        ! -name ".*" \
        ! -name "*.dump" \
        ! -name "*~" \
        ! -name "#*" \
        ! -name "*test*" \
        ! -name TAGS \
        ! -name "*.orig" \
        ! -name "*.rej" \
        ! -name semantic.cache \
        ! -name "*-" \
        ! -name "*old" \
        ! -name "*bak" \
    | xargs grep --color=auto $@ 2>/dev/null;
}
