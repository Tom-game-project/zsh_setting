autoload -U colors; colors

function git-prompt {
  local branchname branch st commithash
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return 
  fi
  branchname=`git rev-parse --abbrev-ref --short HEAD 2> /dev/null`
  commithash=`git rev-parse HEAD`
  #echo $branchname
  if [[ "$branchname" == "HEAD" ]]; then
    branchname=$commithash
  else
    branchname=$branchname
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
alias ccs='cc -Wall -Wextra -Werror -g -fsanitize=address'
alias zellij='~/.zsh/zellij'
alias graph='git log --decorate --graph --all --name-status'
alias tomgitset='git config --local user.name "Tom0427"
git config --local user.email 82128211+Tom-game-project@users.noreply.github.com'

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



