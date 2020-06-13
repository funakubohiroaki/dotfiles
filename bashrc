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
export PATH=$PATH:~/ruby-2.1.2/bin:~/bin:~/.nodebrew/current/bin:~/google-cloud-sdk/bin:/usr/local/Cellar/mysql/8.0.12/bin:/usr/local/opt/mysql-client/bin:/usr/local/scala-2.12.10/bin
export SCALA_HOME=/usr/local/scala-2.12.10
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# tab
set tabstop=4

# completion
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Go
export GOENV_ROOT=$HOME/.goenv
export GOENV_SHELL=bash
export GOENV_DISABLE_GOPATH=1
source $GOENV_ROOT/libexec/../completions/goenv.bash
command goenv rehash 2>/dev/null
goenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(goenv "sh-$command" "$@")";;
  *)
    command goenv "$command" "$@";;
  esac
}
export GOPATH=~/go
export PATH=$PATH:$GOENV_ROOT/bin:$GOENV_ROOT/shims:$GOPATH/bin

# pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# gem
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/bin

# iXam
export EBISU_INFRA_DIR=/Users/a13974/github.com/CyberAgent/ebisu-infra
export EBISU_WEB_DIR=/Users/a13974/github.com/CyberAgent/ebisu-web
export OAHU_BACKEND_DIR=/Users/a13974/github.com/CyberAgent/oahu-api
export OAHU_DOC_DIR=/Users/a13974/github.com/CyberAgent/oahu-doc
export OAHU_FRONTEND_DIR=/Users/a13974/github.com/CyberAgent/oahu-front
export OAHU_INFRA_DIR=/Users/a13974/github.com/CyberAgent/oahu-ops
export SAIGON_AUTH_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-auth
export SAIGON_BATCH_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-batch
export SAIGON_FACEBOOK_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-facebook
export SAIGON_FRONTEND_DIR=/Users/a13974/github.com/CyberAgent/saigon-front
export SAIGON_INFRA_DIR=/Users/a13974/github.com/CyberAgent/saigon-server-build
export SAIGON_LAP_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-lap
export SAIGON_TWITTER_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-twitter
export SAIGON_WORKER_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-worker
export SAIGON_YINFEED_DIR=/Users/a13974/go/src/github.com/CyberAgent/saigon-yinfeed
export SATSUMA_BACKEND_DIR=~/go/src/github.com/CyberAgent/satsuma-backend
export SATSUMA_FRONTEND_DIR=~/github.com/CyberAgent/satsuma-frontend
export SATSUMA_INFRA_DIR=~/github.com/CyberAgent/satsuma-infra
export TASK_TRACKER_DIR=/Users/a13974/github.com/CyberAgent/one-task-tracker
export TM_BACKEND_DIR=/Users/a13974/github.com/CyberAgent/task-manager-back
export TM_FRONTEND_DIR=/Users/a13974/github.com/CyberAgent/task-manager-front
export TM_INFRA_DIR=/Users/a13974/github.com/CyberAgent/task-manager-docs
export AITD_COLLECTOR_DIR=/Users/a13974/github.com/CyberAgent/aitd-collector
export AITD_DATA_DIR=/Users/a13974/github.com/CyberAgent/aitd-data-service
export AITD_ESTIMATOR_DIR=/Users/a13974/github.com/CyberAgent/aitd-estimator
export AITD_ESTIMATOR_2_DIR=/Users/a13974/github.com/CyberAgent/aitd-estimator-v2
export AITD_GENERATOR_DIR=/Users/a13974/github.com/CyberAgent/aitd-generator
export AITD_INFRA_DIR=/Users/a13974/github.com/CyberAgent/aitd-infra
export AITD_MIGRATION_DIR=/Users/a13974/github.com/CyberAgent/aitd-migration
export AITD_WEB_DIR=/Users/a13974/github.com/CyberAgent/aitd-web-service
export AITD_WORD_DIR=/Users/a13974/github.com/CyberAgent/aitd-word-embedding-service

# alias
alias vi='/usr/bin/vim'
alias ll='/bin/ls -l'
alias ldd='otool -L'
#alias g='git'
#alias gc='git branch | grep -v bk | sed "s/[*| ] //g" | peco | xargs -n1 git checkout ; git branch'
#alias B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias gb='git branch'
alias gs='git status'
alias k='kubectl'
alias monkey='cd ~/go/src/github.com/monkey/funakubo'
alias unsetd='unset ${!DOCKER_*}'
alias xcode_cache_clear='rm -rf /Users/a13974/Library/Developer/Xcode/DerivedData'

alias docker-oahu-backend='kubectl exec -it `kubectl get pods | grep oahu-backend | cut -f 1 -d " "` sh'
alias docker-oahu-db='kubectl exec -it `kubectl get pods | grep oahu-db | cut -f 1 -d " "` sh'
alias docker-oahu-frontend='kubectl exec -it `kubectl get pods | grep oahu-frontend | cut -f 1 -d " "` sh'
alias docker-oahu-redis='kubectl exec -it `kubectl get pods | grep oahu-redis | cut -f 1 -d " "` sh'

alias ebisu-infra='cd $EBISU_INFRA_DIR'
alias ebisu-web='cd $EBISU_WEB_DIR'
alias oahu-api='cd $GOPATH/src/github.com/CyberAgent/oahu-api'
alias oahu-design='cd ~/github.com/CyberAgent/oahu-design'
alias oahu-doc='cd $OAHU_DOC_DIR'
alias oahu-front='cd $OAHU_FRONTEND_DIR'
alias oahu-ios='cd ~/github.com/CyberAgent/oahu-ios'
alias oahu-issues='cd ~/github.com/CyberAgent/oahu-issues'
alias oahu-ops='cd $OAHU_INFRA_DIR'
alias oahu-worker='cd $GOPATH/src/github.com/CyberAgent/oahu-worker'
alias saigon-auth='cd $SAIGON_AUTH_DIR'
alias saigon-batch='cd $SAIGON_BATCH_DIR'
alias saigon-facebook='cd $SAIGON_FACEBOOK_DIR'
alias saigon-frontend='cd $SAIGON_FRONTEND_DIR'
alias saigon-infra='cd $SAIGON_INFRA_DIR'
alias saigon-lap='cd $SAIGON_LAP_DIR'
alias saigon-twitter='cd $SAIGON_TWITTER_DIR'
alias saigon-worker='cd $SAIGON_WORKER_DIR'
alias saigon-yinfeed='cd $SAIGON_YINFEED_DIR'
alias satsuma-backend='cd $SATSUMA_BACKEND_DIR'
alias satsuma-frontend='cd $SATSUMA_FRONTEND_DIR'
alias satsuma-infra='cd $SATSUMA_INFRA_DIR'
alias satsuma_dev='cloud_sql_proxy -instances=cyberagent-018:asia-northeast1:satsuma-db-dev=tcp:33066'
alias satsuma_prd='cloud_sql_proxy -instances=cyberagent-018:asia-northeast1:satsuma-db-prd=tcp:33068'
alias satsuma_stg='cloud_sql_proxy -instances=cyberagent-018:asia-northeast1:satsuma-db-staging=tcp:33067'
alias tasktracker='cd $TASK_TRACKER_DIR'
alias tm-backend='cd $TM_BACKEND_DIR'
alias tm-docs='cd $TM_INFRA_DIR'
alias tm-frontend='cd $TM_FRONTEND_DIR'
alias vertex-backend='cd ~/github.com/CyberAgent/vertex-api-go'
alias vertex-frontend='cd ~/github.com/CyberAgent/vertex-front'
alias aitd_demo='cloud_sql_proxy -instances=cyberagent-315:asia-northeast1:aitd-cloudsql-demo=tcp:0.0.0.0:33069'
alias aitd_prd='cloud_sql_proxy -instances=cyberagent-315:asia-northeast1:aitd-cloudsql-prd=tcp:33070'
alias aitd-collector='cd $AITD_COLLECTOR_DIR'
alias aitd-data='cd $AITD_DATA_DIR'
alias aitd-estimator='cd $AITD_ESTIMATOR_DIR'
alias aitd-estimator2='cd $AITD_ESTIMATOR_2_DIR'
alias aitd-generator='cd $AITD_GENERATOR_DIR'
alias aitd-infra='cd $AITD_INFRA_DIR'
alias aitd-migration='cd $AITD_MIGRATION_DIR'
alias aitd-web='cd $AITD_WEB_DIR'
alias aitd-word='cd $AITD_WORD_DIR'

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
