# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export EDITOR=vi

# PATH
export PATH=$PATH:/home/funakubo_hiroaki/ruby-2.1.2/bin:/home/funakubo_hiroaki/bin:/home/funakubo_hiroaki/go/bin

# tab
set tabstop=4

export GOPATH=/home/funakubo_hiroaki/.go

# alias
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
