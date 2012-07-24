# =============================================================================
# Exports
# =============================================================================

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
export EDITOR='mate -w'
export RUBYOPT=rubygems
export JEWELER_OPTS="--rspec --gemcutter"
export GIT_EDITOR="mate -w"
export NODE_PATH=/usr/local/lib/node_modules

# Opscode exports
export OPSCODE_USER="bkether"
export OPSCODE_FULLNAME="Bruno Barros"
export ORGNAME=""
export USER_PEM=""
export aws_access_key_id=""
export aws_secret_access_key=""

# =============================================================================
# Alias
# =============================================================================

# projects
alias proj="cd ~/projetos"
alias dot="cd ~/projetos/my_dotfiles"
alias tm_bundles="cd ~/Library/Application\ Support/TextMate/Bundles"
alias sementes="cd ~/projetos/sementes"
alias octo="cd ~/projetos/octopress"
alias pow="cd ~/.pow"
alias liga="cd ~/projetos/liga"


# ruby and rails related #
alias ruby_path='ruby -r rubygems -e "p Gem.path"'
alias strftime='cat ~/.strftime'
alias rs="rails s"
alias rg="rails g"
alias rc='rails c'

alias tstart='thin start'
alias tstop='thin stop'

alias rt='rake --trace'
alias rtf='rake test:functionals --trace'
alias rti='rake test:integration --trace'
alias rtl='rake test:lib --trace'
alias rtp='rake test:plugins --trace'
alias rts='rake test:services --trace'
alias rtu='rake test:units --trace'

alias migrate='rake db:migrate db:test:prepare'
alias rdr='rake db:rollback'
alias routes='rake routes'
alias mroute='rake routes | mate'

# capistrano
alias dep='cap deploy'

# rspec
alias spc="spec spec/"

# cucumber
alias cuke="cucumber --guess"

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
alias rebash='source ~/.bash_profile'
alias clone='~/.terminal_clone_tab.sh'
alias term_keys='cat ~/.term_bindings'
alias mignore='mate ~/.gitignore'
alias mjanus='mate ~/.janus.rake'
alias mgit='mate ~/.gitconfig'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias df='df -h'
alias du='du -h'

alias less='less -r' # raw control characters
alias grep='egrep --color' # show differences in colour

# memchached #
alias mem='memcached -vvv'

# redis and resque #
alias redis="redis-server /usr/local/etc/redis.conf" # start redis old school
alias resque="VVERBOSE=1 QUEUE=* rake environment resque:work" # start resque
alias resque-web="resque-web -p 8282 config/initializers/resque-web.rb" # start resque-web

# textmate #
alias reload_bundles="osascript -e 'tell app \"TextMate\" to reload bundles'"

# Pair programming
alias pair='sh ~/.pair'
alias unpair='sh ~/.unpair'

# Misc #
alias speedup='sudo rm -rf /private/var/log/asl/*'

# PostgreSQL #
alias postgresql.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresql.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# =============================================================================
# Completations
# =============================================================================

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

COMPLETION="$HOME/.completion/*.bash"
for config_file in $COMPLETION
do
  source $config_file
done

### End Completions ###


### Misc Utilities ###

UTILITIES="$HOME/.bash_utilities/*.bash"
for config_file in $UTILITIES
do
  source $config_file
done

# =============================================================================
# Prompt
# =============================================================================

# Set colours
c_blue=`tput setaf 6`
c_white=`tput setaf 7`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_yellow=`tput setaf 3`
c_sgr0=`tput sgr0`

# Get hash of head if exists
parse_git_hash ()
{
  if git rev-parse --short HEAD >/dev/null 2>&1
    then
      githash=$(git rev-parse --short HEAD)
    else
      return 0
  fi
  echo -e "${c_yellow} $githash${c_sgr0}"
}

__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}


# Swap colours if branch is dirty
branch_color ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
        then
            color=""
        if git diff --quiet 2>/dev/null >&2
            then
                color="${c_green}"
            else
                color=${c_red}
        fi
    else
        return 0
    fi
    echo -ne $color
}

# Print that sucker
export PS1='\[${c_white}\w\[\[${c_blue}\[ `~/.rvm/bin/rvm-prompt v`\[${c_sgr0}\[$(branch_color)\]$(__git_ps1)\[${c_white} '

# =============================================================================
# RVM
# =============================================================================

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion