> software (u can install them with `apt-get install`)

package suggest
 * `command-not-found`

office
 * `libreoffice`

dictionary
 * `goldendict`

picture viewer
 * `viewnior`
 
picture editor
 * `gimp`
 * `kolourpaint4`

vpn
 * `lantern`

monitor
 * `htop`

> command in bash

git show branch graph
 * `git log --graph --decorate --oneline`

rotate screen
 * `xrandr --output VGA1 --rotate left`

> bashrc modification

`PS1='\n\[\033[01;34m\]\w \[\033[01;32m\]\u \[\033[00m\]\n'`

```bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -a'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto '
    alias fgrep='fgrep --color=auto '
    alias egrep='egrep --color=auto '
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
 
source /etc/zsh_command_not_found  

alias g="grep --exclude=tags -nr"

alias y='python /bin/youdao'
alias copy='rsync -v'

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JRE_HOME=$JAVA_HOME/jre
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export ANDROID_HOME=/home/yexiaorain/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

``` 

`aptitude show <package name>`

`/var/log/apt/history.log`

`apt show <package name>`
