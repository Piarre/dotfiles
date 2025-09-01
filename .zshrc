export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.console-ninja/.bin:$HOME/kepa:/Users/kepa/.bun/bin:$PATH"
export EDITOR="code --wait"

ZSH_THEME="fino"
plugins=(git)
TERM=xterm-256color

abort() {
    gum style "Aborting..." --foreground=9 --padding="1 1" --margin="1 2" --width="20" --align="center" --border="rounded" --border-foreground=9 --bold
}

HEADER_NAME="Kepa's script"

alias k1="cd && cd ../../Volumes/KepaDrive01/"
alias k2="cd && cd ../../Volumes/KepaDrive02/"

alias djo="source .env/bin/activate && python manage.py runserver"

alias kgn='open "https://github.com/new?name=$(gum input --placeholder="Repository name" --header=$HEADER_NAME --header.foreground="212" --char-limit=72 --width=72)"'
alias kcm='git commit -m "$(gum input --placeholder="Commit name" --header=$HEADER_NAME --header.foreground="212" --char-limit=72 --width=72)" -m "$(gum write --placeholder="Commit description" --header.foreground="212" --header=$HEADER_NAME)"'
alias kpo='gum confirm "Push with git push -u origin main" && gum spin  --show-output --spinner="globe" -- git push -u origin main || abort'
alias knr='gum confirm "Create new repository here $PWD ?" && git init && git remote add origin $(gum input --placeholder="https://github.com/Piarre" --header="Repository link" --header.foreground="212" --char-limit=72 --width=72) && git branch -M main || abort'
alias knext='gum spin --title="Deleting .next/" --spinner="line" -- rm -rf .next/ && gum confirm "Restart with :" --affirmative="bun" --negative="npm" && bun run dev || npm run dev'
alias kdev='code . && bun run dev'
alias khelp='gum pager "$(alias | grep "^k")" --show-line-numbers'
alias kzsh='source ~/.zshrc'
alias ss='open -b com.apple.ScreenSaver.Engine'
alias kh='eval $(history | sort -nr | awk '\''{$1=""; print substr($0,2)}'\'' | awk '\''!seen[$0]++'\'' | gum filter --reverse --header="Command history - $(hostname)" --header.foreground="99" --indicator="~>" --placeholder="...")'
alias kvenv='source .venv/bin/activate'

# autoload -U +X bashcompinit && bashcompinit
alias cs='~/CLI/coding-style.sh $PWD ~/CLI/coding-style-report-log/ && bat ~/CLI/coding-style-report-log/coding-style-reports.log'

# bun completions
[ -s "/Users/kepa/.bun/_bun" ] && source "/Users/kepa/.bun/_bun"

source $ZSH/oh-my-zsh.sh

clear
fastfetch

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
