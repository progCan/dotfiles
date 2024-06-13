if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light hlissner/zsh-autopair
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=9999999999999
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases and environment variables
alias nothing=":"
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"'
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'
alias h="history | grep "
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
alias checkcommand="type -t"
alias openports='netstat -nape --inet'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
alias swww="/home/progCan/swww/target/release/swww"
alias swww-daemon="/home/progCan/swww/target/release/swww-daemon"
alias weather="curl -s wttr.in | head -n -1"
alias f="fuck"
alias screenshot="slurp | grim -g"
alias screenrecord="wf-recorder -f ~/recording-$(date +"%d-%m-%Y-%T").mp4"
alias pacman="sudo pacman"
alias minecraft="java -jar ~/Downloads/Minecraft\ Launcher.jar"
export BEMENU_BACKEND="wayland"
alias llama2="ollama run llama2"
alias llama3="ollama run llama3"
alias mistral="ollama run mistral"
# Never gonna give you up
alias rickroll="curl ascii.live/can-you-hear-me"
alias btw="neofetch -L | lolcat -F 0.4 -S 12 && echo 'I use Arch.' | lolcat -F 1.8 -S 7"
alias BTW="icat btw.png && echo 'I use arch.' | lolcat -F 1.8"
export MOZ_ENABLE_WAYLAND=1
alias rmv="rm -rf"
alias srmv="sudo rm -rf"
alias duh="du -h"
alias play="mpv"
alias icat="kitten icat"
alias joke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/; echo'
alias umatrix="unimatrix -s 96"
alias ff="fastfetch"
alias nf="neofetch"
alias nn="nano"
alias n="nvim"
alias nv="nvim"
alias e="edit"
alias v="vim"
alias edit="nvim"
alias bad-apple="npm start --prefix ~/Bad-Apple/"
# cmatrix does not support terminal color schemes, so we alias it to a similar alternative instead
alias cmatrix="unimatrix -l o -s 96"
alias Code="cd ~/Code; nvim"
unset 'AUTOPAIR_PAIRS[ ]'
alias parrot="curl parrot.live"
alias christmastree="curl https://raw.githubusercontent.com/sergiolepore/ChristBASHTree/master/tree-EN.sh | bash"
# To edit files that need elevated privileges
alias sn="sudo nvim"
alias nh="nethack"
alias hjkl="vim"
# Disabled because of p10k instant prompt (instant prompt does not support output on shell startup)
# echo "I use Arch btw" | lolcat -F 1.4
