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
alias ..='cd ..'
alias c='clear'
alias du='du -ch'
alias df='df -h'
alias share='python -m SimpleHTTPServer'
alias halt='halt -p'

# Open man pages with most for colorize.
hash most &> /dev/null
if [ $? -eq 0 ]; then
    alias man='man -P most'
fi

# from bekir
alias syslog='sudo tail -F -n 25 /var/log/syslog.log | ccze -A -p syslog'
alias dmesgc='dmesg | ccze -A'
alias dt='date +%H:%M:%S\ %Y-%m-%d\ %a\ %b | ccze -A'
psc () { /bin/ps $@ | ccze -A; }
tail () { /usr/bin/tail $@ | ccze -A; }
t () { /usr/bin/tail -f * | ccze -A; }
ant () { /usr/bin/ant $@ | ccze -A ; }

# Backup file before edit
svim() { cp {,`date +%Y%m%d`_}$*; vim "$*"; }

# Remove unnecessary lines from file
sedc(){ sed -e '/^#/d' -e 's/#.*$//' $1; }

# Quickly cd out Directories : up 2 == cd ../../
up() { local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }


bcp(){ mkdir -p `dirname $2` && cp -R "$1" "$2"; }
bmv(){ mkdir -p `dirname $2` && mv "$1" "$2"; }

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

# simplified systemd command, for instance "sudo systemctl stop xxx.service" - > "0.stop xxx"
if ! systemd-notify --booted;
then  # for not systemd
    0.start() {
        sudo rc.d start $1
    }

    0.restart() {
        sudo rc.d restart $1
    }

    0.stop() {
        sudo rc.d stop $1
    }
else
# start systemd service
    0.start() {
        sudo systemctl start $1.service
    }
# restart systemd service
    0.restart() {
        sudo systemctl restart $1.service
    }
# stop systemd service
    0.stop() {
        sudo systemctl stop $1.service
    }
# enable systemd service
    0.enable() {
        sudo systemctl enable $1.service
    }
# disable a systemd service
    0.disable() {
        sudo systemctl disable $1.service
    }
# show the status of a service
    0.status() {
        systemctl status $1.service
    }
# reload a service configuration
    0.reload() {
        sudo systemctl reload $1.service
    }
# list all running service
    0.list() {
        systemctl
    }
# list all failed service
    0.failed () {
        systemctl --failed
    }
# list all systemd available unit files
    0.list-files() {
        systemctl list-unit-files
    }
# check the log
    0.log() {
        sudo journalctl
    }
# show wants
    0.wants() {
        systemctl show -p "Wants" $1.target
    }
# analyze the system
    0.analyze() {
        systemd-analyze $1
    }
fi
