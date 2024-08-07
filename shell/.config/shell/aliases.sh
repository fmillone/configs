# Aliases
unalias rm cp mv >/dev/null 2>/dev/null
unalias l lS lart lr lrt lsn lsr fd ff >/dev/null 2>/dev/null

alias gl='git --no-pager log --oneline'
alias grom='git rebase origin/master'
alias gron='git rebase origin/main'
alias grod='git rebase origin/develop'
alias gss='git status -sb'
alias doco='docker-compose'
alias docolt='docker-compose logs -ft'
alias sc='jq ".scripts"'
alias sc.='jq ".scripts" package.json'
alias gpo='git push origin'
alias gpoc='git push origin $(git branch --show-current)'
alias z='zellij'
alias za='zellij attach'
alias zla='zellij --layout'
alias lg='lazygit'

if which eza >/dev/null; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza --icons --group-directories-first -l"
  alias la="eza --icons -lghaa --group-directories-first"
  alias lt="eza --icons --tree"
  alias lta="eza --icons --tree -a"
else
  alias eza="ls --color"
  alias ls="ls --color"
  alias ll="ls -l"
  alias la="ls -lgha"
  alias lt="tree"
  alias lta="tree -a"
fi
alias l.="ls -ld .*"

if type stow >/dev/null; then
  alias stow='stow -t ~'
fi

if type fdfind >/dev/null; then
  alias fd="fdfind"
fi
# TODO:
# alias fdd= fd find dirs
# alias fdf= fd find files

alias check_tools="check_installed git lazygit chroma zellij tmux starship vim nvim aws eza jq tldr fd rg fzf tree"
