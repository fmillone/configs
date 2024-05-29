# Aliases
alias ls='ls --color'
alias gl='git --no-pager log --oneline'
alias grom='git rebase origin/master'
alias gron='git rebase origin/main'
alias grod='git rebase origin/develop'
alias nest='npx @nestjs/cli'
alias gss='git status -sb'
alias doco='docker-compose'
alias docolt='docker-compose logs -ft'
alias sc='jq ".scripts"'
alias sc.='jq ".scripts" package.json'
alias gpo='git push origin'
alias gpoc='git push origin $(git branch --show-current)'
alias lg='lazygit'

if which eza >/dev/null; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza --icons --group-directories-first -l"
  alias la="eza --icons -lgha --group-directories-first"
  alias lt="eza --icons --tree"
  alias lta="eza --icons --tree -a"
else
  alias ls="ls --color"
  alias ll="ls -l"
  alias la="ls -lgha"
  alias lt="tree"
  alias lta="tree -a"
fi

alias check_tools="check_installed git lazygit aws eza jq tldr fd rg fzf tree"
