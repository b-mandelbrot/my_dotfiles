# =============================================================================
# RVM
# =============================================================================

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git ruby osx rvm brew bundler gem git-flow npm node redis-cli)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# =============================================================================
# Exports
# =============================================================================
export GOROOT="/usr/local/go"
export GOBIN="/usr/local/go/bin/"
export GOPATH="$HOME/projetos/go"
export CFLAGS="-arch x86_64 -O2"
export ARCHFLAGS="-arch x86_64"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:~:$PATH:."
export MANPATH="/opt/local/share/man:$MANPATH"
export LANG="en_US.UTF-8"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export TERM=xterm-color
export LSCOLORS=DxGxcxdxCxegedabagacad
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export EDITOR='mvim'
export RUBYOPT=rubygems
export JEWELER_OPTS="--rspec --gemcutter"
export GIT_EDITOR="mvim"
export NODE_PATH=/usr/local/lib/node_modules

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Opscode exports
export OPSCODE_USER="bkether"
export OPSCODE_FULLNAME="Bruno Barros"
export ORGNAME=""
export USER_PEM=""
export aws_access_key_id=""
export aws_secret_access_key=""

# Performance
alias speedup='sudo rm -rf /private/var/log/asl/*'

# Resque and Memcached
alias mem='memcached -vvv'

# redis and resque #
alias redis="redis-server /usr/local/etc/redis.conf" # start redis old school
alias resque="VVERBOSE=1 QUEUE=* rake environment resque:work" # start resque
alias resque-web="resque-web -p 8282 config/initializers/resque-web.rb" # start resque-web

# Bundler
alias b="bundle"
alias bopen="bundle open"
alias bi="b install --path vendor"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

# system #
alias chmod_help='cat ~/.chmod'
alias home='cd ~'
alias l='ls -lah'
alias tf='tail -f'
alias mb='mate ~/.bash_profile'
alias rebash='source ~/.zshrc'
alias term_keys='cat ~/.term_bindings'
alias mignore='mvim ~/.gitignore'
alias mjanus='mvim ~/.janus.rake'
alias mgit='mvim ~/.gitconfig'
alias mzsh='mvim ~/.zshrc'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias df='df -h'
alias du='du -h'

alias less='less -r' # raw control characters
alias grep='egrep --color' # show differences in colour
