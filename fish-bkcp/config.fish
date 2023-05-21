fish_config theme choose "Dracula Official"
#some important alias
alias nupd='sudo nala update'
alias install='sudo nala install' #highlight the search term when using the grep command.
alias ubupd='sudo apt update && sudo apt upgrade'
alias search='sudo nala search' #search package
alias remove='sudo nala remove'
alias uburemove='sudo apt remove'
alias grep='grep --color=auto'
alias cls='clear' #clear the terminal screen.
alias df='df -h' #display disk space usage in human-readable format 
alias ls='exa --icons'
alias nf='neofetch'
alias ips='ip -c -br a'
alias cat='batcat'
alias hg='history|grep' #search for a command on history fish shell
alias mkdir='mkdir -p'
alias pls='sudo'
#shell-genie (gpt-3 on terminal)
alias g3='shell-genie ask'
alias g3ex='shell-genie ask --explain'

#created by `pipx` on 2023-04-26 03:31:02
set PATH $PATH /home/ghostxprince/.local/bin

#conda's base environment
eval "$(/home/ghostxprince/anaconda3/bin/conda shell.fish hook)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ghostxprince/anaconda3/bin/conda
    eval /home/ghostxprince/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

