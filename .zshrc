autoload -U colors; colors

function git-prompt {
  local branchname branch st
  branchname=`git symbolic-ref --short HEAD 2> /dev/null`
  if [ -z "$branchname" ]; then
    return
  fi
  st=`git status --short 2> /dev/null`
  if [ -z $st ]; then
    branch="${fg[green]}($branchname)$reset_color"
  else
    branch="${fg[yellow]}($branchname)$reset_color"
    #branch="${fg[red]}($branchname)$reset_color"
  fi
  echo "$branch"
}

# path
export PATH=~/.cargo/bin:$PATH


# alias
alias ccw='cc -Wall -Wextra -Werror'
alias zellij='~/.zsh/zellij'
alias graph='git log --decorate --graph --all --name-status'

alias francinette=~/francinette/tester.sh
alias paco=~/francinette/tester.sh
function precmd
{
  setopt PROMPT_SUBST
  B='📂 %U%~%u%K{black}%F{green}📍%f%k'
  C="`git-prompt`"
  D='%F{yellow}$%f'
  PROMPT="$B $C
╰┈➤ "
  unsetopt PROMPT_SUBST
}

# prompt
#setopt PROMPT_SUBST
#PROMPT='%F{green}%*%f %F{yello}%~%f %F{red}${vcs_info_msg_0_}%f> '

# プロンプトカスタマイズ
#B='📂 %K{cyan}%F{black}%~%f%k%K{black}%F{green}📍%f%k'

