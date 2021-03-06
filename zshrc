# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias diff='colordiff'

alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'
alias -s txt=$EDITOR
alias -s html=$BROWSER

#Aliases hub to git so you can use all the features added by hub 
#with the git command
eval "$(hub alias -s)"

#Create a new folder and cd into it
#ex.) mcd new_folder
function mcd() {
  mkdir -p "$1" && cd "$1";
}

#Migrate, rollback, migrate, and prepare the test db with the command migrate
function migrate() {
  rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare;
}

#Create a new rails project, switch to its directory, initialize a git repo,
#and create the first commit for it with your new project
#ex.) rails_new MyAwesomeProject
function rails_new() {
  rails new $1 -d postgresql && cd $1 && git init && git add . && git commit -m 'Initial commit';
}

#Same as rails new, but also creates a github repo and pushes your new project
#to github. The string after the project name will be the github description
#ex.) rails_newgh WeMail "New shared email service!"
function rails_newgh() {
  rails new $1 -d postgresql && cd $1 && git init && git add . && git commit -m 'Initial commit' && git create -d $2 && git push -u origin master;
}

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

DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github pip python)

source $ZSH/oh-my-zsh.sh
PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
