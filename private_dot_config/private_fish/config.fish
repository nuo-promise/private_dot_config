set fish_greeting ""

set -gx TERM xterm-256color

# shell-gpt
set -gx PATH $PATH /Users/nuo/Library/Python/3.9/bin

# starship
starship init fish | source

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g fish_color_autosuggestion 555

#esp32
alias get_idf='. $HOME/esp/v5.5.1/esp-idf/export.fish'

#git
alias gpo "g push origin "
alias lg lazygit
alias gcm 'g commit -m'
alias ga 'g add *'

# tmux
alias tl "tmux list-sessions"
alias tk "tmux kill-session -t"
alias ta "tmux attach -t"
alias tc "tmux new-session -s"

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias python python3

alias 2ssh ~/Documents/tools/ssh.sh
alias xn ~/Documents/tools/xn.sh
alias xf ~/Documents/tools/xf.sh
alias sx ~/Documents/tools/sx.sh
alias cx ~/Documents/tools/cx.sh
alias kh ~/Documents/tools/kh.sh
alias sm ~/Documents/tools/sm.sh
alias cs ~/Documents/tools/cs.sh
alias yq ~/Documents/tools/yq.sh
alias IP ~/Documents/tools/IP.sh
alias cls clear
alias vi nvim
alias vim nvim
alias vsfz ~/Documents/tools/vsfz.sh
alias esfz ~/Documents/tools/esfz.sh


command -qv nvim && alias vim nvim
set -gx EDITOR nvim

# gemini cli

set -gx GEMINI_API_KEY AIzaSyClVGc3w7d-IV8O-5MAQ6g2S6XuYbBOAU0

# kimi k2
set -gx ANTHROPIC_AUTH_TOKEN sk-CUS3IJyBwpC7QlYxmeBgsLn0ztlIZzbdNe4FxSl20qH85ck8
set -gx ANTHROPIC_BASE_URL https://api.moonshot.cn/anthropic

# http proxy
#set -gx https_proxy http://127.0.0.1:7891
#set -gx http_proxy http://127.0.0.1:7891
#set -gx all_proxy socks5://127.0.0.1:7891

# ELECTRON
set -gx ELECTRON_CACHE /Users/nuo/.electron

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /usr/local/bin $PATH

# mysql 
set -gx PATH /usr/local/mysql/bin $PATH

set -gx PATH /opt/homebrew/bin $PATH
# XDG_CONFIG_HOME Environmental on-variable
set -gx XDG_CONFIG_HOME ~/.config/
# NodeJS
set -gx PATH node_modules/.bin $PATH

# Apache maven
set -gx PATH ~/Documents/tools/apache-maven-3.9.6/bin $PATH

# ide
set -gx PATH ~/.scripts/ide $PATH
set -gx PATH ~/.scripts/vs $PATH
set -gx PATH ~/.scripts/vl $PATH
set -gx PATH ~/.scripts/hl $PATH
set -gx PATH ~/Documents/tools $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# java sdk
set -gx JAVA_HOME $(/usr/libexec/java_home -v 17)

# Flutter
set -g PUB_HOSTED_URL https://pub.flutter-io.cn
set -g FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
set -gx PATH /Users/nuo/Documents/flutter/bin $PATH

# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Setting PATH for Python 3.12
# The original version is saved in /Users/nuo/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bin" "$PATH"

# Added by Antigravity
fish_add_path /Users/nuo/.antigravity/antigravity/bin

# Added by Antigravity
fish_add_path /Users/nuo/.antigravity/antigravity/bin

# Amp CLI
export PATH="/Users/nuo/.amp/bin:$PATH"
set -gx PATH $HOME/go/bin $PATH

# zellij auto start
if status is-interactive
    and not set -q ZELLIJ
    zellij
end
