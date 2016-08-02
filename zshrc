source ~/.zsh/completion/git-prompt.zsh

export EDITOR=vim

alias ba='git branch -a'
alias gc='git checkout'
alias gs='git status'
alias gpo='git push origin'
alias ls='ls --color=auto'

# peco kei
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
# C-r -> peco
function peco-select-history() {
    typeset tac
    if which tac > /dev/null; then
        tac=tac
    else
        tac='tail -r'
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# C-q -> find
function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")
    result=''
    for file in $selected_files; do
        result="${result}$(echo $file | tr '\n' ' ')"
    done
    BUFFER="${BUFFER}${result}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^f' peco-find-file
function peco-git-diff() {
  git rev-parse --git-dir >/dev/null 2>&1
  if [[ $? == 0 ]]; then
    local target=$(git diff --stat $1 | peco | awk '{print $1}')
    if [[ -n $target ]]; then
      vimdiff <(git show $1:$target) $target
    fi
  fi
}
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


export RBENV_ROOT="/usr/local/rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"

export PATH=/opt/elixir/bin:$PATH
export PATH=/opt/elixir/bin:$PATH
