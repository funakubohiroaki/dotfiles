# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# direnv
eval "$(direnv hook bash)"

# User specific aliases and functions
export EDITOR=vi
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json

# PATH
export PATH=$PATH:~/ruby-2.1.2/bin:~/bin:~/.nodebrew/current/bin:~/google-cloud-sdk/bin:/usr/local/Cellar/mysql/8.0.12/bin

# tab
set tabstop=4

# Git
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash

# Go
export GOROOT=/usr/local/go
export GOPATH=~/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# gem
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/bin

# iXam
export SATSUMA_INFRA_DIR=~/github.com/CyberAgent/satsuma-infra
export SATSUMA_FRONTEND_DIR=~/github.com/CyberAgent/satsuma-frontend
export SATSUMA_BACKEND_DIR=~/go/src/github.com/CyberAgent/satsuma-backend
export EBISU_INFRA_DIR=/Users/a13974/github.com/CyberAgent/ebisu-infra
export EBISU_WEB_DIR=/Users/a13974/github.com/CyberAgent/ebisu-web
export SAIGON_INFRA_DIR=/Users/a13974/github.com/CyberAgent/saigon-server-build
export SAIGON_AUTH_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-auth
export SAIGON_BATCH_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-batch
export SAIGON_FACEBOOK_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-facebook
export SAIGON_FRONTEND_DIR=/Users/a13974/github.com/CyberAgent/saigon-front
export SAIGON_LAP_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-lap
export SAIGON_TWITTER_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-twitter
export SAIGON_YINFEED_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-yinfeed
export SAIGON_WORKER_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-worker
export TASK_TRACKER_DIR=/Users/a13974/github.com/CyberAgent/one-task-tracker
export OAHU_INFRA_DIR=/Users/a13974/github.com/CyberAgent/oahu-ops
export OAHU_DOC_DIR=/Users/a13974/github.com/CyberAgent/oahu-doc
export OAHU_FRONTEND_DIR=/Users/a13974/github.com/CyberAgent/oahu-front
export OAHU_BACKEND_DIR=/Users/a13974/go/src/github.com/CyberAgent/oahu-api

# alias
alias vi='/usr/bin/vim'
alias ll='/bin/ls -l'
alias ldd='otool -L'
#alias g='git'
#alias gc='git branch | grep -v bk | sed "s/[*| ] //g" | peco | xargs -n1 git checkout ; git branch'
#alias B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias oahu-api='cd $GOPATH/src/github.com/CyberAgent/oahu-api'
alias oahu-worker='cd $GOPATH/src/github.com/CyberAgent/oahu-worker'
alias oahu-design='cd ~/github.com/CyberAgent/oahu-design'
alias oahu-doc='cd ~/github.com/CyberAgent/oahu-doc'
alias oahu-front='cd ~/github.com/CyberAgent/oahu-front'
alias oahu-ios='cd ~/github.com/CyberAgent/oahu-ios'
alias oahu-ops='cd ~/github.com/CyberAgent/oahu-ops'
alias unsetd='unset ${!DOCKER_*}'
alias satsuma_dev='cloud_sql_proxy -instances=cyberagent-018:asia-northeast1:satsuma-db-dev=tcp:33066'
alias satsuma_stg='cloud_sql_proxy -instances=cyberagent-018:asia-northeast1:satsuma-db-staging=tcp:33067'
alias satsuma_prd='cloud_sql_proxy -instances=cyberagent-018:asia-northeast1:satsuma-db-prd=tcp:33068'
alias xcode_cache_clear='rm -rf /Users/a13974/Library/Developer/Xcode/DerivedData'
alias monkey='cd ~/go/src/github.com/monkey/funakubo'
alias satsuma-infra='cd $SATSUMA_INFRA_DIR'
alias satsuma-frontend='cd $SATSUMA_FRONTEND_DIR'
alias satsuma-backend='cd $SATSUMA_BACKEND_DIR'
alias ebisu-infra='cd $EBISU_INFRA_DIR'
alias ebisu-web='cd $EBISU_WEB_DIR'
alias saigon-infra='cd $SAIGON_INFRA_DIR'
alias saigon-auth='cd $SAIGON_AUTH_DIR'
alias saigon-batch='cd $SAIGON_BATCH_DIR'
alias saigon-facebook='cd $SAIGON_FACEBOOK_DIR'
alias saigon-frontend='cd $SAIGON_FRONTEND_DIR'
alias saigon-lap='cd $SAIGON_LAP_DIR'
alias saigon-twitter='cd $SAIGON_TWITTER_DIR'
alias saigon-yinfeed='cd $SAIGON_YINFEED_DIR'
alias saigon-worker='cd $SAIGON_WORKER_DIR'
alias tasktracker='cd $TASK_TRACKER_DIR'

function ch() {
	echo $1
	base="/usr/local/apache2/htdocs/sem-portal/sem_staging/$1/searchsuite"
	alias sem='cd $base'
	alias script='cd $base/script'
	alias fuel='cd $base/fuel'
	alias app='cd $base/fuel/app'
	alias log='cd $base/fuel/app/logs'
	alias pub='cd $base/public'
	alias js='cd $base/public/assets/js'
	alias css='cd $base/public/assets/css'
	alias con='cd $base/fuel/app/classes/controller'
	alias mod='cd $base/fuel/app/classes/model'
	alias util='cd $base/fuel/app/classes/util'
	alias vie='cd $base/fuel/app/views'
	alias tasks='cd $base/fuel/app/tasks'
	alias fcd='cd "$(find $base -type d | peco)"'
}
ch b_funakubo
