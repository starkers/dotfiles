load_aliases() {
	local FILE=~/.aliases
	[ -f ${FILE} ] && source ${FILE}
	local FILE=~/.aliases-other
	[ -f ${FILE} ] && source ${FILE}
}

load_profile() {
	if [ -f ~/.profile ]; then
		source ~/.profile
	fi
}

load_ps1() {
	Color_Off="\[\033[0m\]" # Text Reset

	# Regular Colors
	Black="\[\033[0;30m\]"  # Black
	Red="\[\033[0;31m\]"    # Red
	Green="\[\033[0;32m\]"  # Green
	Yellow="\[\033[0;33m\]" # Yellow
	Blue="\[\033[0;34m\]"   # Blue
	Purple="\[\033[0;35m\]" # Purple
	Cyan="\[\033[0;36m\]"   # Cyan
	White="\[\033[0;37m\]"  # White

	# Bold
	BBlack="\[\033[1;30m\]"  # Black
	BRed="\[\033[1;31m\]"    # Red
	BGreen="\[\033[1;32m\]"  # Green
	BYellow="\[\033[1;33m\]" # Yellow
	BBlue="\[\033[1;34m\]"   # Blue
	BPurple="\[\033[1;35m\]" # Purple
	BCyan="\[\033[1;36m\]"   # Cyan
	BWhite="\[\033[1;37m\]"  # White

	# Underline
	UBlack="\[\033[4;30m\]"  # Black
	URed="\[\033[4;31m\]"    # Red
	UGreen="\[\033[4;32m\]"  # Green
	UYellow="\[\033[4;33m\]" # Yellow
	UBlue="\[\033[4;34m\]"   # Blue
	UPurple="\[\033[4;35m\]" # Purple
	UCyan="\[\033[4;36m\]"   # Cyan
	UWhite="\[\033[4;37m\]"  # White

	# Background
	On_Black="\[\033[40m\]"  # Black
	On_Red="\[\033[41m\]"    # Red
	On_Green="\[\033[42m\]"  # Green
	On_Yellow="\[\033[43m\]" # Yellow
	On_Blue="\[\033[44m\]"   # Blue
	On_Purple="\[\033[45m\]" # Purple
	On_Cyan="\[\033[46m\]"   # Cyan
	On_White="\[\033[47m\]"  # White

	# High Intensty
	IBlack="\[\033[0;90m\]"  # Black
	IRed="\[\033[0;91m\]"    # Red
	IGreen="\[\033[0;92m\]"  # Green
	IYellow="\[\033[0;93m\]" # Yellow
	IBlue="\[\033[0;94m\]"   # Blue
	IPurple="\[\033[0;95m\]" # Purple
	ICyan="\[\033[0;96m\]"   # Cyan
	IWhite="\[\033[0;97m\]"  # White

	# Bold High Intensty
	BIBlack="\[\033[1;90m\]"  # Black
	BIRed="\[\033[1;91m\]"    # Red
	BIGreen="\[\033[1;92m\]"  # Green
	BIYellow="\[\033[1;93m\]" # Yellow
	BIBlue="\[\033[1;94m\]"   # Blue
	BIPurple="\[\033[1;95m\]" # Purple
	BICyan="\[\033[1;96m\]"   # Cyan
	BIWhite="\[\033[1;97m\]"  # White

	# High Intensty backgrounds
	On_IBlack="\[\033[0;100m\]"  # Black
	On_IRed="\[\033[0;101m\]"    # Red
	On_IGreen="\[\033[0;102m\]"  # Green
	On_IYellow="\[\033[0;103m\]" # Yellow
	On_IBlue="\[\033[0;104m\]"   # Blue
	On_IPurple="\[\033[10;95m\]" # Purple
	On_ICyan="\[\033[0;106m\]"   # Cyan
	On_IWhite="\[\033[0;107m\]"  # White

	# Various variables you might want for your PS1 prompt instead
	Time12h="\T"
	Time12a="\@"
	PathShort="\w"
	PathFull="\W"
	NewLine="\n"
	Jobs="\j"

	# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
	# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

	export PS1=$IPurple$Time12a$Color_Off'$(git branch &>/dev/null;\
  if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
      # @4 - Clean repository - nothing to commit
      echo "'$Green'"$(__git_ps1 " (%s)"); \
    else \
      # @5 - Changes to working tree
      echo "'$IRed'"$(__git_ps1 " {%s}"); \
    fi) '$BYellow$PathShort$Color_Off'\$ "; \
  else \
    # @2 - Prompt when not in GIT repo
    echo " '$Yellow$PathShort$Color_Off'\$ "; \
  fi)'
}

load_git_functions() {
	source ~/.bashrc_git
}

#interactive?
if [ ! -z PS1 ]; then
	# interactive
	load_aliases
	load_git_functions
	load_ps1

	###### like zsh Ctrl+w
	stty werase undef
	# bind '\C-w:unix-filename-rubout'
	bind '\C-w:backward-kill-word'

	## fzf Ctrl+r history search
	source ~/.fzf/shell/completion.bash
	source ~/.fzf/shell/key-bindings.bash

	# direnv
	hash direnv 2>/dev/null && eval "$(direnv hook bash)"

	# autocomplete "make"
	complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

shopt -s autocd         #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

load_profile
