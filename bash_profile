export GROOVY_HOME=/Users/cbrown/jar/groovy-1.8.6/
export PATH=/Users/cbrown/jar/groovy-1.8.6/bin:/Users/cbrown/dev/grails-2.1.1/bin:$PATH
export PATH=$PATH:$GROOVY_HOME/bin

export GRAILS_HOME=/Users/cbrown/dev/grails-2.1.1/
export PATH=$PATH:$GRAILS_HOME/bin

export GRADLE_HOME=/Users/cbrown/dev/gradle-1.2/
export PATH=$PATH:$GRADLE_HOME/bin

# Setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=$EC2_HOME/pk-GIWOVJ6HYQ7OIIWPQ3RY4OKT2FHTF64F.pem
export EC2_CERT=$EC2_HOME/cert-GIWOVJ6HYQ7OIIWPQ3RY4OKT2FHTF64F.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# spike1 AWS
alias spike1-start-mc='ec2-start-instances i-15656074'
alias spike1-stop-mc='ec2-stop-instances i-15656074'

spike1-which() {
	echo `ec2-describe-instances | awk '/^INSTANCE/ {print $4}'`
}

spike1-ssh() {
	ssh -o "StrictHostKeyChecking no" -i ~/.ec2/spike1-cbrown.pem ubuntu@`ec2-describe-instances | awk '/^INSTANCE/ {print $4}'`
}

spike1-stop-server() {
	ec2-stop-instances `ec2-describe-instances -F "tag:role=server" | awk '/^INSTANCE/ {print $2}'`
}

spike1-start-server() {
	ec2-start-instances `ec2-describe-instances -F "tag:role=server" | awk '/^INSTANCE/ {print $2}'`
        ec2-associate-address 23.21.244.108 -i i-43611927
}

spike1-ssh-server() {
	ssh -o "StrictHostKeyChecking no" -i ~/.ec2/spike1-cbrown.pem ubuntu@`ec2-describe-instances -F "tag:role=server" | awk '/^INSTANCE/ {print $4}'`
}

spike1-scp-server() {
        scp -o "StrictHostKeyChecking no" -i ~/.ec2/spike1-cbrown.pem $1 ubuntu@`ec2-describe-instances -F "tag:role=server" | awk '/^INSTANCE/ {print $4}'`:/tmp
}

abspath () { case "$1" in /*)printf "%s\n" "$1";; *)printf "%s\n" "$PWD/$1";; esac; }

###
# http://www.sallyroth.us/?p=73
label() {
	echo -e "\033];$1\007"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# http://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically#comment13715_13019
source ~/.bashrc

export PS1="\! \W $ "
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

case "$TERM" in
xterm*|rxvt*)
DISP='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
BASHLOG='/Users/cbrown/.bash_history.log'
SAVEBASH='if [ "$(id -u)" -ne 0 ]; then echo "`date +"%Y-%m-%d %H:%M:%S"` `pwd` `history 1`" >> ${BASHLOG}; fi'
PROMPT_COMMAND="${DISP};${SAVEBASH}"
;;
*)
;;
esac

alias git-iu="git status -s | grep ^?? | awk '{print $2}' >> ~/.gitignore_global"
