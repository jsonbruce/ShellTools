# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/max/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="dst"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git colored-man-pages cp extract z zsh-autosuggestions pip autojump \
  docker golang kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

 export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

export PS4='+{$LINENO:${FUNCNAME[0]}} '

# proxy
export http_proxy="http://127.0.0.1:8123"
export https_proxy="http://127.0.0.1:8123"
export all_proxy="http://127.0.0.1:8123"
export no_proxy="localhost,127.0.0.1,10.219.51.9"

# alias
alias ll="ls -lh --group-directories-first --sort=extension"
alias tree="tree --dirsfirst --sort=name"

alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"

alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# alias - docker
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Sogou Pinyin
export GTK_IM_MODULE=fcitx    
export QT_IM_MODULE=fcitx    
export XMODIFIERS="@im=fcitx" 


# Java
export JAVA_HOME=/usr/local/lib/java/jdk1.8.0_181
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

# Kotlin
export KOTLIN_HOME=/usr/local/lib/kotlin/kotlinc
export PATH=$KOTLIN_HOME/bin:$PATH

# Nodejs
export NODEJS_HOME=/usr/local/lib/nodejs/node-v10.15.3
export PATH=$NODEJS_HOME/bin:$PATH

# Maven
export MAVEN_HOME=/usr/local/lib/maven/apache-maven-3.5.4
export PATH=$MAVEN_HOME/bin:$PATH

# Gradle
export GRADLE_HOME=/usr/local/lib/gradle/gradle-4.9
export PATH=$GRADLE_HOME/bin:$PATH

# Android
export ANDROID_HOME=~/Develop/Android/Sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

# CUDA
export PATH=/usr/local/lib/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib/cuda-9.0/lib64:/usr/local/lib/cuda-9.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Julia
export PATH=/usr/local/lib/julia/julia-1.0.0/bin:$PATH


# Flutter
export FLUTTER_HOME=~/Develop/flutter
export PATH=$FLUTTER_HOME/bin:$PATH

# Go
export GOROOT=/usr/local/lib/go/go-1.12.5
export GOPATH=~/Develop/Go
export GOPROXY=https://proxy.golang.org
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GO111MODULE=auto

# Rust
export PATH=~/.cargo/bin:$PATH

# ProtoBuf
export PATH=/usr/local/lib/protobuf/bin:$PATH

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end


# pip3 zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3
# pip3 zsh completion end


# docker-compose completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i



# autojump
[[ -s /home/max/.autojump/etc/profile.d/autojump.sh ]] && source /home/max/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
