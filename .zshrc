source $HOME/dev/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh

antigen theme agnoster

#antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle z
antigen bundle fasd
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle compleat
antigen bundle osx
antigen bundle common-aliases
antigen bundle web-search
antigen bundle kennethreitz/autoenv
antigen bundle command-not-found
antigen bundle history
antigen bundle rsync
antigen bundle python
antigen bundle pip
antigen bundle virtualenvwrapper

#antigen bundle vi-mode

antigen apply

export EDITOR=vim

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/opt/maven/bin

alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# commandlinefu.com shortcut
clfu() {
    #urlencoded_query=$(python -c "import sys, urllib as ul; print ul.quote_plus(' '.join(sys.argv[1:]))" $@)
    #base64_query=$(echo -n $@ | base64)
    #echo "http://www.commandlinefu.com/commands/matching/$urlencoded_query/$base64_query/plaintext"
    curl -s "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /+/g')/$(echo -n $@ | base64)/plaintext"
}

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# activate vi mode
#bindkey -v

bindkey '^B' push-line-or-edit
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export JAVA_HOME=$(jenv javahome)

source $HOME/dev/tools/google-cloud-sdk/path.zsh.inc
#source $HOME/dev/tools/google-cloud-sdk/completion.zsh.inc

export PATH=$HOME/anaconda3/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
