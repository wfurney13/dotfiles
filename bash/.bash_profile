#aliases
alias whatismyip="curl ipinfo.io/ip"
alias cls="clear"
alias freespace="df --human-readable"
alias reload="source ~/.bash_profile"
alias edprof="nvim ~/.bash_profile"


#functions
function d() 
{
cd $1; ls; 
}
