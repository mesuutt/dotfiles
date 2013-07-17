# most used commands
function histstats() {
    cut -f1 -d' ' ~/.bash_history | sort | uniq -c | sort -nr | head -n ${1:=30}
}
