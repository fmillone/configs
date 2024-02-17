# Aliases
alias gl='git --no-pager log --oneline'
alias grom='git rebase origin/master'
alias gron='git rebase origin/main'
alias grod='git rebase origin/develop'
alias nest='npx @nestjs/cli'
alias gss='git status -sb'
alias dai_price="curl 'https://be.buenbit.com/api/market/tickers/' | jq '{darsV: .object.daiars.selling_price, darsC: .object.daiars.purchase_price, dusdV: .object.daiusd.selling_price, dusdC: .object.daiusd.purchase_price }'"
alias doco='docker-compose'
alias docolt='docker-compose logs -ft'
alias sc='jq ".scripts"'
alias sc.='jq ".scripts" package.json'
alias gpo='git push origin'
alias gpoc='git push origin $(git branch --show-current)'
alias lg='lazygit'
