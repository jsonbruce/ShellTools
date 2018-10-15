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
  git colored-man-pages cp extract z zsh-autosuggestions pip autojump zsh-syntax-highlighting docker tldr
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

# alias
alias ll="ls -lh --group-directories-first --sort=extension"

alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"

alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"

# alias - docker
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"


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


# Java
export JAVA_HOME=/usr/local/lib/java/jdk1.8.0_181
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

# Kotlin
export KOTLIN_HOME=/usr/local/lib/kotlin/kotlinc
export PATH=$KOTLIN_HOME/bin:$PATH

# Nodejs
export NODEJS_HOME=/usr/local/lib/nodejs/node-v8.12.0
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

# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#compdef minikube

__minikube_bash_source() {
	alias shopt=':'
	alias _expand=_bash_expand
	alias _complete=_bash_comp
	emulate -L sh
	setopt kshglob noshglob braceexpand
	source "$@"
}
__minikube_type() {
	# -t is not supported by zsh
	if [ "$1" == "-t" ]; then
		shift
		# fake Bash 4 to disable "complete -o nospace". Instead
		# "compopt +-o nospace" is used in the code to toggle trailing
		# spaces. We don't support that, but leave trailing spaces on
		# all the time
		if [ "$1" = "__minikube_compopt" ]; then
			echo builtin
			return 0
		fi
	fi
	type "$@"
}
__minikube_compgen() {
	local completions w
	completions=( $(compgen "$@") ) || return $?
	# filter by given word as prefix
	while [[ "$1" = -* && "$1" != -- ]]; do
		shift
		shift
	done
	if [[ "$1" == -- ]]; then
		shift
	fi
	for w in "${completions[@]}"; do
		if [[ "${w}" = "$1"* ]]; then
			echo "${w}"
		fi
	done
}
__minikube_compopt() {
	true # don't do anything. Not supported by bashcompinit in zsh
}
__minikube_declare() {
	if [ "$1" == "-F" ]; then
		whence -w "$@"
	else
		builtin declare "$@"
	fi
}
__minikube_ltrim_colon_completions()
{
	if [[ "$1" == *:* && "$COMP_WORDBREAKS" == *:* ]]; then
		# Remove colon-word prefix from COMPREPLY items
		local colon_word=${1%${1##*:}}
		local i=${#COMPREPLY[*]}
		while [[ $((--i)) -ge 0 ]]; do
			COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
		done
	fi
}
__minikube_get_comp_words_by_ref() {
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[${COMP_CWORD}-1]}"
	words=("${COMP_WORDS[@]}")
	cword=("${COMP_CWORD[@]}")
}
__minikube_filedir() {
	local RET OLD_IFS w qw
	__debug "_filedir $@ cur=$cur"
	if [[ "$1" = \~* ]]; then
		# somehow does not work. Maybe, zsh does not call this at all
		eval echo "$1"
		return 0
	fi
	OLD_IFS="$IFS"
	IFS=$'\n'
	if [ "$1" = "-d" ]; then
		shift
		RET=( $(compgen -d) )
	else
		RET=( $(compgen -f) )
	fi
	IFS="$OLD_IFS"
	IFS="," __debug "RET=${RET[@]} len=${#RET[@]}"
	for w in ${RET[@]}; do
		if [[ ! "${w}" = "${cur}"* ]]; then
			continue
		fi
		if eval "[[ \"\${w}\" = *.$1 || -d \"\${w}\" ]]"; then
			qw="$(__minikube_quote "${w}")"
			if [ -d "${w}" ]; then
				COMPREPLY+=("${qw}/")
			else
				COMPREPLY+=("${qw}")
			fi
		fi
	done
}
__minikube_quote() {
	if [[ $1 == \'* || $1 == \"* ]]; then
		# Leave out first character
		printf %q "${1:1}"
	else
		printf %q "$1"
	fi
}
autoload -U +X bashcompinit && bashcompinit
# use word boundary patterns for BSD or GNU sed
LWORD='[[:<:]]'
RWORD='[[:>:]]'
if sed --help 2>&1 | grep -q GNU; then
	LWORD='\<'
	RWORD='\>'
fi
__minikube_convert_bash_to_zsh() {
	sed \
	-e 's/declare -F/whence -w/' \
	-e 's/_get_comp_words_by_ref "\$@"/_get_comp_words_by_ref "\$*"/' \
	-e 's/local \([a-zA-Z0-9_]*\)=/local \1; \1=/' \
	-e 's/flags+=("\(--.*\)=")/flags+=("\1"); two_word_flags+=("\1")/' \
	-e 's/must_have_one_flag+=("\(--.*\)=")/must_have_one_flag+=("\1")/' \
	-e "s/${LWORD}_filedir${RWORD}/__minikube_filedir/g" \
	-e "s/${LWORD}_get_comp_words_by_ref${RWORD}/__minikube_get_comp_words_by_ref/g" \
	-e "s/${LWORD}__ltrim_colon_completions${RWORD}/__minikube_ltrim_colon_completions/g" \
	-e "s/${LWORD}compgen${RWORD}/__minikube_compgen/g" \
	-e "s/${LWORD}compopt${RWORD}/__minikube_compopt/g" \
	-e "s/${LWORD}declare${RWORD}/__minikube_declare/g" \
	-e "s/\\\$(type${RWORD}/\$(__minikube_type/g" \
	<<'BASH_COMPLETION_EOF'
# bash completion for minikube                             -*- shell-script -*-

__minikube_debug()
{
    if [[ -n ${BASH_COMP_DEBUG_FILE} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
    fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__minikube_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

__minikube_index_of_word()
{
    local w word=$1
    shift
    index=0
    for w in "$@"; do
        [[ $w = "$word" ]] && return
        index=$((index+1))
    done
    index=-1
}

__minikube_contains_word()
{
    local w word=$1; shift
    for w in "$@"; do
        [[ $w = "$word" ]] && return
    done
    return 1
}

__minikube_handle_reply()
{
    __minikube_debug "${FUNCNAME[0]}"
    case $cur in
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace
            fi
            local allflags
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}")
            else
                allflags=("${flags[*]} ${two_word_flags[*]}")
            fi
            COMPREPLY=( $(compgen -W "${allflags[*]}" -- "$cur") )
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
            fi

            # complete after --flag=abc
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace
                fi

                local index flag
                flag="${cur%=*}"
                __minikube_index_of_word "${flag}" "${flags_with_completion[@]}"
                COMPREPLY=()
                if [[ ${index} -ge 0 ]]; then
                    PREFIX=""
                    cur="${cur#*=}"
                    ${flags_completion[${index}]}
                    if [ -n "${ZSH_VERSION}" ]; then
                        # zsh completion needs --flag= prefix
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
                    fi
                fi
            fi
            return 0;
            ;;
    esac

    # check if we are handling a flag with special work handling
    local index
    __minikube_index_of_word "${prev}" "${flags_with_completion[@]}"
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]}
        return
    fi

    # we are parsing a flag and don't have a special handler, no completion
    if [[ ${cur} != "${words[cword]}" ]]; then
        return
    fi

    local completions
    completions=("${commands[@]}")
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions=("${must_have_one_noun[@]}")
    fi
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}")
    fi
    COMPREPLY=( $(compgen -W "${completions[*]}" -- "$cur") )

    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        COMPREPLY=( $(compgen -W "${noun_aliases[*]}" -- "$cur") )
    fi

    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        declare -F __custom_func >/dev/null && __custom_func
    fi

    # available in bash-completion >= 2, not always present on macOS
    if declare -F __ltrim_colon_completions >/dev/null; then
        __ltrim_colon_completions "$cur"
    fi

    # If there is only 1 completion and it is a flag with an = it will be completed
    # but we don't want a space after the =
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
       compopt -o nospace
    fi
}

# The arguments should be in the form "ext1|ext2|extn"
__minikube_handle_filename_extension_flag()
{
    local ext="$1"
    _filedir "@(${ext})"
}

__minikube_handle_subdirs_in_dir_flag()
{
    local dir="$1"
    pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1
}

__minikube_handle_flag()
{
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    # if a command required a flag, and we found it, unset must_have_one_flag()
    local flagname=${words[c]}
    local flagvalue
    # if the word contained an =
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=} # take in as flagvalue after the =
        flagname=${flagname%=*} # strip everything after the =
        flagname="${flagname}=" # but put the = back
    fi
    __minikube_debug "${FUNCNAME[0]}: looking for ${flagname}"
    if __minikube_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=()
    fi

    # if you set a flag which only applies to this command, don't show subcommands
    if __minikube_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
      commands=()
    fi

    # keep flag value with flagname as flaghash
    # flaghash variable is an associative array which is only supported in bash > 3.
    if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ] ; then
            flaghash[${flagname}]=${flagvalue}
        elif [ -n "${words[ $((c+1)) ]}" ] ; then
            flaghash[${flagname}]=${words[ $((c+1)) ]}
        else
            flaghash[${flagname}]="true" # pad "true" for bool flag
        fi
    fi

    # skip the argument to a two word flag
    if __minikube_contains_word "${words[c]}" "${two_word_flags[@]}"; then
        c=$((c+1))
        # if we are looking for a flags value, don't show commands
        if [[ $c -eq $cword ]]; then
            commands=()
        fi
    fi

    c=$((c+1))

}

__minikube_handle_noun()
{
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    if __minikube_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=()
    elif __minikube_contains_word "${words[c]}" "${noun_aliases[@]}"; then
        must_have_one_noun=()
    fi

    nouns+=("${words[c]}")
    c=$((c+1))
}

__minikube_handle_command()
{
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    local next_command
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}"
    else
        if [[ $c -eq 0 ]]; then
            next_command="_minikube_root_command"
        else
            next_command="_${words[c]//:/__}"
        fi
    fi
    c=$((c+1))
    __minikube_debug "${FUNCNAME[0]}: looking for ${next_command}"
    declare -F "$next_command" >/dev/null && $next_command
}

__minikube_handle_word()
{
    if [[ $c -ge $cword ]]; then
        __minikube_handle_reply
        return
    fi
    __minikube_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
    if [[ "${words[c]}" == -* ]]; then
        __minikube_handle_flag
    elif __minikube_contains_word "${words[c]}" "${commands[@]}"; then
        __minikube_handle_command
    elif [[ $c -eq 0 ]]; then
        __minikube_handle_command
    else
        __minikube_handle_noun
    fi
    __minikube_handle_word
}

_minikube_addons_configure()
{
    last_command="minikube_addons_configure"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_disable()
{
    last_command="minikube_addons_disable"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_enable()
{
    last_command="minikube_addons_enable"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_list()
{
    last_command="minikube_addons_list"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons_open()
{
    last_command="minikube_addons_open"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    flags+=("--https")
    local_nonpersistent_flags+=("--https")
    flags+=("--interval=")
    local_nonpersistent_flags+=("--interval=")
    flags+=("--url")
    local_nonpersistent_flags+=("--url")
    flags+=("--wait=")
    local_nonpersistent_flags+=("--wait=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_addons()
{
    last_command="minikube_addons"
    commands=()
    commands+=("configure")
    commands+=("disable")
    commands+=("enable")
    commands+=("list")
    commands+=("open")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    local_nonpersistent_flags+=("--format=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_add()
{
    last_command="minikube_cache_add"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_delete()
{
    last_command="minikube_cache_delete"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache_list()
{
    last_command="minikube_cache_list"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    local_nonpersistent_flags+=("--format=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_cache()
{
    last_command="minikube_cache"
    commands=()
    commands+=("add")
    commands+=("delete")
    commands+=("list")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_completion()
{
    last_command="minikube_completion"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("-h")
    local_nonpersistent_flags+=("--help")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_get()
{
    last_command="minikube_config_get"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_set()
{
    last_command="minikube_config_set"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_unset()
{
    last_command="minikube_config_unset"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config_view()
{
    last_command="minikube_config_view"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    local_nonpersistent_flags+=("--format=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_config()
{
    last_command="minikube_config"
    commands=()
    commands+=("get")
    commands+=("set")
    commands+=("unset")
    commands+=("view")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_dashboard()
{
    last_command="minikube_dashboard"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--url")
    local_nonpersistent_flags+=("--url")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_delete()
{
    last_command="minikube_delete"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_docker-env()
{
    last_command="minikube_docker-env"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--no-proxy")
    local_nonpersistent_flags+=("--no-proxy")
    flags+=("--shell=")
    local_nonpersistent_flags+=("--shell=")
    flags+=("--unset")
    flags+=("-u")
    local_nonpersistent_flags+=("--unset")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ip()
{
    last_command="minikube_ip"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_logs()
{
    last_command="minikube_logs"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--follow")
    flags+=("-f")
    local_nonpersistent_flags+=("--follow")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_mount()
{
    last_command="minikube_mount"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--9p-version=")
    local_nonpersistent_flags+=("--9p-version=")
    flags+=("--gid=")
    local_nonpersistent_flags+=("--gid=")
    flags+=("--ip=")
    local_nonpersistent_flags+=("--ip=")
    flags+=("--kill")
    local_nonpersistent_flags+=("--kill")
    flags+=("--msize=")
    local_nonpersistent_flags+=("--msize=")
    flags+=("--uid=")
    local_nonpersistent_flags+=("--uid=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_profile()
{
    last_command="minikube_profile"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_service_list()
{
    last_command="minikube_service_list"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--namespace=")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--format=")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_service()
{
    last_command="minikube_service"
    commands=()
    commands+=("list")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    flags+=("--https")
    local_nonpersistent_flags+=("--https")
    flags+=("--interval=")
    local_nonpersistent_flags+=("--interval=")
    flags+=("--namespace=")
    two_word_flags+=("-n")
    local_nonpersistent_flags+=("--namespace=")
    flags+=("--url")
    local_nonpersistent_flags+=("--url")
    flags+=("--wait=")
    local_nonpersistent_flags+=("--wait=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ssh()
{
    last_command="minikube_ssh"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_ssh-key()
{
    last_command="minikube_ssh-key"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_start()
{
    last_command="minikube_start"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-ips=")
    local_nonpersistent_flags+=("--apiserver-ips=")
    flags+=("--apiserver-name=")
    local_nonpersistent_flags+=("--apiserver-name=")
    flags+=("--apiserver-names=")
    local_nonpersistent_flags+=("--apiserver-names=")
    flags+=("--cache-images")
    local_nonpersistent_flags+=("--cache-images")
    flags+=("--container-runtime=")
    local_nonpersistent_flags+=("--container-runtime=")
    flags+=("--cpus=")
    local_nonpersistent_flags+=("--cpus=")
    flags+=("--disable-driver-mounts")
    local_nonpersistent_flags+=("--disable-driver-mounts")
    flags+=("--disk-size=")
    local_nonpersistent_flags+=("--disk-size=")
    flags+=("--dns-domain=")
    local_nonpersistent_flags+=("--dns-domain=")
    flags+=("--docker-env=")
    local_nonpersistent_flags+=("--docker-env=")
    flags+=("--docker-opt=")
    local_nonpersistent_flags+=("--docker-opt=")
    flags+=("--extra-config=")
    local_nonpersistent_flags+=("--extra-config=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--gpu")
    local_nonpersistent_flags+=("--gpu")
    flags+=("--host-only-cidr=")
    local_nonpersistent_flags+=("--host-only-cidr=")
    flags+=("--hyperkit-vpnkit-sock=")
    local_nonpersistent_flags+=("--hyperkit-vpnkit-sock=")
    flags+=("--hyperkit-vsock-ports=")
    local_nonpersistent_flags+=("--hyperkit-vsock-ports=")
    flags+=("--hyperv-virtual-switch=")
    local_nonpersistent_flags+=("--hyperv-virtual-switch=")
    flags+=("--insecure-registry=")
    local_nonpersistent_flags+=("--insecure-registry=")
    flags+=("--iso-url=")
    local_nonpersistent_flags+=("--iso-url=")
    flags+=("--keep-context")
    local_nonpersistent_flags+=("--keep-context")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--kvm-network=")
    local_nonpersistent_flags+=("--kvm-network=")
    flags+=("--memory=")
    local_nonpersistent_flags+=("--memory=")
    flags+=("--mount")
    local_nonpersistent_flags+=("--mount")
    flags+=("--mount-string=")
    local_nonpersistent_flags+=("--mount-string=")
    flags+=("--network-plugin=")
    local_nonpersistent_flags+=("--network-plugin=")
    flags+=("--nfs-share=")
    local_nonpersistent_flags+=("--nfs-share=")
    flags+=("--nfs-shares-root=")
    local_nonpersistent_flags+=("--nfs-shares-root=")
    flags+=("--registry-mirror=")
    local_nonpersistent_flags+=("--registry-mirror=")
    flags+=("--uuid=")
    local_nonpersistent_flags+=("--uuid=")
    flags+=("--vm-driver=")
    local_nonpersistent_flags+=("--vm-driver=")
    flags+=("--xhyve-disk-driver=")
    local_nonpersistent_flags+=("--xhyve-disk-driver=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_status()
{
    last_command="minikube_status"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--format=")
    local_nonpersistent_flags+=("--format=")
    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_stop()
{
    last_command="minikube_stop"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_update-check()
{
    last_command="minikube_update-check"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_update-context()
{
    last_command="minikube_update-context"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_version()
{
    last_command="minikube_version"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_minikube_root_command()
{
    last_command="minikube"
    commands=()
    commands+=("addons")
    commands+=("cache")
    commands+=("completion")
    commands+=("config")
    commands+=("dashboard")
    commands+=("delete")
    commands+=("docker-env")
    commands+=("ip")
    commands+=("logs")
    commands+=("mount")
    commands+=("profile")
    commands+=("service")
    commands+=("ssh")
    commands+=("ssh-key")
    commands+=("start")
    commands+=("status")
    commands+=("stop")
    commands+=("update-check")
    commands+=("update-context")
    commands+=("version")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--bootstrapper=")
    two_word_flags+=("-b")
    flags+=("--log_backtrace_at=")
    flags+=("--log_dir=")
    flags+=("--logtostderr")
    flags+=("--profile=")
    two_word_flags+=("-p")
    flags+=("--stderrthreshold=")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

__start_minikube()
{
    local cur prev words cword
    declare -A flaghash 2>/dev/null || :
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __minikube_init_completion -n "=" || return
    fi

    local c=0
    local flags=()
    local two_word_flags=()
    local local_nonpersistent_flags=()
    local flags_with_completion=()
    local flags_completion=()
    local commands=("minikube")
    local must_have_one_flag=()
    local must_have_one_noun=()
    local last_command
    local nouns=()

    __minikube_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_minikube minikube
else
    complete -o default -o nospace -F __start_minikube minikube
fi

# ex: ts=4 sw=4 et filetype=sh

BASH_COMPLETION_EOF
}
__minikube_bash_source <(__minikube_convert_bash_to_zsh)

# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

__kubeadm_bash_source() {
	alias shopt=':'
	alias _expand=_bash_expand
	alias _complete=_bash_comp
	emulate -L sh
	setopt kshglob noshglob braceexpand

	source "$@"
}

__kubeadm_type() {
	# -t is not supported by zsh
	if [ "$1" == "-t" ]; then
		shift

		# fake Bash 4 to disable "complete -o nospace". Instead
		# "compopt +-o nospace" is used in the code to toggle trailing
		# spaces. We don't support that, but leave trailing spaces on
		# all the time
		if [ "$1" = "__kubeadm_compopt" ]; then
			echo builtin
			return 0
		fi
	fi
	type "$@"
}

__kubeadm_compgen() {
	local completions w
	completions=( $(compgen "$@") ) || return $?

	# filter by given word as prefix
	while [[ "$1" = -* && "$1" != -- ]]; do
		shift
		shift
	done
	if [[ "$1" == -- ]]; then
		shift
	fi
	for w in "${completions[@]}"; do
		if [[ "${w}" = "$1"* ]]; then
			echo "${w}"
		fi
	done
}

__kubeadm_compopt() {
	true # don't do anything. Not supported by bashcompinit in zsh
}

__kubeadm_ltrim_colon_completions()
{
	if [[ "$1" == *:* && "$COMP_WORDBREAKS" == *:* ]]; then
		# Remove colon-word prefix from COMPREPLY items
		local colon_word=${1%${1##*:}}
		local i=${#COMPREPLY[*]}
		while [[ $((--i)) -ge 0 ]]; do
			COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
		done
	fi
}

__kubeadm_get_comp_words_by_ref() {
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[${COMP_CWORD}-1]}"
	words=("${COMP_WORDS[@]}")
	cword=("${COMP_CWORD[@]}")
}

__kubeadm_filedir() {
	local RET OLD_IFS w qw

	__kubectl_debug "_filedir $@ cur=$cur"
	if [[ "$1" = \~* ]]; then
		# somehow does not work. Maybe, zsh does not call this at all
		eval echo "$1"
		return 0
	fi

	OLD_IFS="$IFS"
	IFS=$'\n'
	if [ "$1" = "-d" ]; then
		shift
		RET=( $(compgen -d) )
	else
		RET=( $(compgen -f) )
	fi
	IFS="$OLD_IFS"

	IFS="," __kubectl_debug "RET=${RET[@]} len=${#RET[@]}"

	for w in ${RET[@]}; do
		if [[ ! "${w}" = "${cur}"* ]]; then
			continue
		fi
		if eval "[[ \"\${w}\" = *.$1 || -d \"\${w}\" ]]"; then
			qw="$(__kubeadm_quote "${w}")"
			if [ -d "${w}" ]; then
				COMPREPLY+=("${qw}/")
			else
				COMPREPLY+=("${qw}")
			fi
		fi
	done
}

__kubeadm_quote() {
    if [[ $1 == \'* || $1 == \"* ]]; then
        # Leave out first character
        printf %q "${1:1}"
    else
    	printf %q "$1"
    fi
}

autoload -U +X bashcompinit && bashcompinit

# use word boundary patterns for BSD or GNU sed
LWORD='[[:<:]]'
RWORD='[[:>:]]'
if sed --help 2>&1 | grep -q GNU; then
	LWORD='\<'
	RWORD='\>'
fi

__kubeadm_convert_bash_to_zsh() {
	sed \
	-e 's/declare -F/whence -w/' \
	-e 's/local \([a-zA-Z0-9_]*\)=/local \1; \1=/' \
	-e 's/flags+=("\(--.*\)=")/flags+=("\1"); two_word_flags+=("\1")/' \
	-e 's/must_have_one_flag+=("\(--.*\)=")/must_have_one_flag+=("\1")/' \
	-e "s/${LWORD}_filedir${RWORD}/__kubeadm_filedir/g" \
	-e "s/${LWORD}_get_comp_words_by_ref${RWORD}/__kubeadm_get_comp_words_by_ref/g" \
	-e "s/${LWORD}__ltrim_colon_completions${RWORD}/__kubeadm_ltrim_colon_completions/g" \
	-e "s/${LWORD}compgen${RWORD}/__kubeadm_compgen/g" \
	-e "s/${LWORD}compopt${RWORD}/__kubeadm_compopt/g" \
	-e "s/${LWORD}declare${RWORD}/builtin declare/g" \
	-e "s/\\\$(type${RWORD}/\$(__kubeadm_type/g" \
	<<'BASH_COMPLETION_EOF'
# bash completion for kubeadm                              -*- shell-script -*-

__kubeadm_debug()
{
    if [[ -n ${BASH_COMP_DEBUG_FILE} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
    fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__kubeadm_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

__kubeadm_index_of_word()
{
    local w word=$1
    shift
    index=0
    for w in "$@"; do
        [[ $w = "$word" ]] && return
        index=$((index+1))
    done
    index=-1
}

__kubeadm_contains_word()
{
    local w word=$1; shift
    for w in "$@"; do
        [[ $w = "$word" ]] && return
    done
    return 1
}

__kubeadm_handle_reply()
{
    __kubeadm_debug "${FUNCNAME[0]}"
    case $cur in
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace
            fi
            local allflags
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}")
            else
                allflags=("${flags[*]} ${two_word_flags[*]}")
            fi
            COMPREPLY=( $(compgen -W "${allflags[*]}" -- "$cur") )
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
            fi

            # complete after --flag=abc
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace
                fi

                local index flag
                flag="${cur%=*}"
                __kubeadm_index_of_word "${flag}" "${flags_with_completion[@]}"
                COMPREPLY=()
                if [[ ${index} -ge 0 ]]; then
                    PREFIX=""
                    cur="${cur#*=}"
                    ${flags_completion[${index}]}
                    if [ -n "${ZSH_VERSION}" ]; then
                        # zsh completion needs --flag= prefix
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
                    fi
                fi
            fi
            return 0;
            ;;
    esac

    # check if we are handling a flag with special work handling
    local index
    __kubeadm_index_of_word "${prev}" "${flags_with_completion[@]}"
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]}
        return
    fi

    # we are parsing a flag and don't have a special handler, no completion
    if [[ ${cur} != "${words[cword]}" ]]; then
        return
    fi

    local completions
    completions=("${commands[@]}")
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions=("${must_have_one_noun[@]}")
    fi
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}")
    fi
    COMPREPLY=( $(compgen -W "${completions[*]}" -- "$cur") )

    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        COMPREPLY=( $(compgen -W "${noun_aliases[*]}" -- "$cur") )
    fi

    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        declare -F __custom_func >/dev/null && __custom_func
    fi

    # available in bash-completion >= 2, not always present on macOS
    if declare -F __ltrim_colon_completions >/dev/null; then
        __ltrim_colon_completions "$cur"
    fi

    # If there is only 1 completion and it is a flag with an = it will be completed
    # but we don't want a space after the =
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
       compopt -o nospace
    fi
}

# The arguments should be in the form "ext1|ext2|extn"
__kubeadm_handle_filename_extension_flag()
{
    local ext="$1"
    _filedir "@(${ext})"
}

__kubeadm_handle_subdirs_in_dir_flag()
{
    local dir="$1"
    pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1
}

__kubeadm_handle_flag()
{
    __kubeadm_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    # if a command required a flag, and we found it, unset must_have_one_flag()
    local flagname=${words[c]}
    local flagvalue
    # if the word contained an =
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=} # take in as flagvalue after the =
        flagname=${flagname%=*} # strip everything after the =
        flagname="${flagname}=" # but put the = back
    fi
    __kubeadm_debug "${FUNCNAME[0]}: looking for ${flagname}"
    if __kubeadm_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=()
    fi

    # if you set a flag which only applies to this command, don't show subcommands
    if __kubeadm_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
      commands=()
    fi

    # keep flag value with flagname as flaghash
    # flaghash variable is an associative array which is only supported in bash > 3.
    if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ] ; then
            flaghash[${flagname}]=${flagvalue}
        elif [ -n "${words[ $((c+1)) ]}" ] ; then
            flaghash[${flagname}]=${words[ $((c+1)) ]}
        else
            flaghash[${flagname}]="true" # pad "true" for bool flag
        fi
    fi

    # skip the argument to a two word flag
    if __kubeadm_contains_word "${words[c]}" "${two_word_flags[@]}"; then
        c=$((c+1))
        # if we are looking for a flags value, don't show commands
        if [[ $c -eq $cword ]]; then
            commands=()
        fi
    fi

    c=$((c+1))

}

__kubeadm_handle_noun()
{
    __kubeadm_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    if __kubeadm_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=()
    elif __kubeadm_contains_word "${words[c]}" "${noun_aliases[@]}"; then
        must_have_one_noun=()
    fi

    nouns+=("${words[c]}")
    c=$((c+1))
}

__kubeadm_handle_command()
{
    __kubeadm_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    local next_command
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}"
    else
        if [[ $c -eq 0 ]]; then
            next_command="_kubeadm_root_command"
        else
            next_command="_${words[c]//:/__}"
        fi
    fi
    c=$((c+1))
    __kubeadm_debug "${FUNCNAME[0]}: looking for ${next_command}"
    declare -F "$next_command" >/dev/null && $next_command
}

__kubeadm_handle_word()
{
    if [[ $c -ge $cword ]]; then
        __kubeadm_handle_reply
        return
    fi
    __kubeadm_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
    if [[ "${words[c]}" == -* ]]; then
        __kubeadm_handle_flag
    elif __kubeadm_contains_word "${words[c]}" "${commands[@]}"; then
        __kubeadm_handle_command
    elif [[ $c -eq 0 ]]; then
        __kubeadm_handle_command
    else
        __kubeadm_handle_noun
    fi
    __kubeadm_handle_word
}

_kubeadm_alpha_phase_addon_all()
{
    last_command="kubeadm_alpha_phase_addon_all"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--image-repository=")
    local_nonpersistent_flags+=("--image-repository=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--pod-network-cidr=")
    local_nonpersistent_flags+=("--pod-network-cidr=")
    flags+=("--service-cidr=")
    local_nonpersistent_flags+=("--service-cidr=")
    flags+=("--service-dns-domain=")
    local_nonpersistent_flags+=("--service-dns-domain=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_addon_coredns()
{
    last_command="kubeadm_alpha_phase_addon_coredns"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--image-repository=")
    local_nonpersistent_flags+=("--image-repository=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--service-cidr=")
    local_nonpersistent_flags+=("--service-cidr=")
    flags+=("--service-dns-domain=")
    local_nonpersistent_flags+=("--service-dns-domain=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_addon_kube-proxy()
{
    last_command="kubeadm_alpha_phase_addon_kube-proxy"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--image-repository=")
    local_nonpersistent_flags+=("--image-repository=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--pod-network-cidr=")
    local_nonpersistent_flags+=("--pod-network-cidr=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_addon()
{
    last_command="kubeadm_alpha_phase_addon"
    commands=()
    commands+=("all")
    commands+=("coredns")
    commands+=("kube-proxy")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token_all()
{
    last_command="kubeadm_alpha_phase_bootstrap-token_all"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--description=")
    local_nonpersistent_flags+=("--description=")
    flags+=("--groups=")
    local_nonpersistent_flags+=("--groups=")
    flags+=("--skip-token-print")
    local_nonpersistent_flags+=("--skip-token-print")
    flags+=("--token=")
    local_nonpersistent_flags+=("--token=")
    flags+=("--token-ttl=")
    local_nonpersistent_flags+=("--token-ttl=")
    flags+=("--usages=")
    local_nonpersistent_flags+=("--usages=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token_cluster-info()
{
    last_command="kubeadm_alpha_phase_bootstrap-token_cluster-info"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token_create()
{
    last_command="kubeadm_alpha_phase_bootstrap-token_create"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--description=")
    local_nonpersistent_flags+=("--description=")
    flags+=("--groups=")
    local_nonpersistent_flags+=("--groups=")
    flags+=("--skip-token-print")
    local_nonpersistent_flags+=("--skip-token-print")
    flags+=("--token=")
    local_nonpersistent_flags+=("--token=")
    flags+=("--token-ttl=")
    local_nonpersistent_flags+=("--token-ttl=")
    flags+=("--usages=")
    local_nonpersistent_flags+=("--usages=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token_node_allow-auto-approve()
{
    last_command="kubeadm_alpha_phase_bootstrap-token_node_allow-auto-approve"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token_node_allow-post-csrs()
{
    last_command="kubeadm_alpha_phase_bootstrap-token_node_allow-post-csrs"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token_node()
{
    last_command="kubeadm_alpha_phase_bootstrap-token_node"
    commands=()
    commands+=("allow-auto-approve")
    commands+=("allow-post-csrs")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_bootstrap-token()
{
    last_command="kubeadm_alpha_phase_bootstrap-token"
    commands=()
    commands+=("all")
    commands+=("cluster-info")
    commands+=("create")
    commands+=("node")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_all()
{
    last_command="kubeadm_alpha_phase_certs_all"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-cert-extra-sans=")
    local_nonpersistent_flags+=("--apiserver-cert-extra-sans=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--service-cidr=")
    local_nonpersistent_flags+=("--service-cidr=")
    flags+=("--service-dns-domain=")
    local_nonpersistent_flags+=("--service-dns-domain=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_apiserver()
{
    last_command="kubeadm_alpha_phase_certs_apiserver"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-cert-extra-sans=")
    local_nonpersistent_flags+=("--apiserver-cert-extra-sans=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--service-cidr=")
    local_nonpersistent_flags+=("--service-cidr=")
    flags+=("--service-dns-domain=")
    local_nonpersistent_flags+=("--service-dns-domain=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_apiserver-etcd-client()
{
    last_command="kubeadm_alpha_phase_certs_apiserver-etcd-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_apiserver-kubelet-client()
{
    last_command="kubeadm_alpha_phase_certs_apiserver-kubelet-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_ca()
{
    last_command="kubeadm_alpha_phase_certs_ca"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_etcd-ca()
{
    last_command="kubeadm_alpha_phase_certs_etcd-ca"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_etcd-healthcheck-client()
{
    last_command="kubeadm_alpha_phase_certs_etcd-healthcheck-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_etcd-peer()
{
    last_command="kubeadm_alpha_phase_certs_etcd-peer"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_etcd-server()
{
    last_command="kubeadm_alpha_phase_certs_etcd-server"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_front-proxy-ca()
{
    last_command="kubeadm_alpha_phase_certs_front-proxy-ca"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_front-proxy-client()
{
    last_command="kubeadm_alpha_phase_certs_front-proxy-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_all()
{
    last_command="kubeadm_alpha_phase_certs_renew_all"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_apiserver()
{
    last_command="kubeadm_alpha_phase_certs_renew_apiserver"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_apiserver-etcd-client()
{
    last_command="kubeadm_alpha_phase_certs_renew_apiserver-etcd-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_apiserver-kubelet-client()
{
    last_command="kubeadm_alpha_phase_certs_renew_apiserver-kubelet-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_etcd-healthcheck-client()
{
    last_command="kubeadm_alpha_phase_certs_renew_etcd-healthcheck-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_etcd-peer()
{
    last_command="kubeadm_alpha_phase_certs_renew_etcd-peer"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_etcd-server()
{
    last_command="kubeadm_alpha_phase_certs_renew_etcd-server"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew_front-proxy-client()
{
    last_command="kubeadm_alpha_phase_certs_renew_front-proxy-client"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--use-api")
    local_nonpersistent_flags+=("--use-api")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_renew()
{
    last_command="kubeadm_alpha_phase_certs_renew"
    commands=()
    commands+=("all")
    commands+=("apiserver")
    commands+=("apiserver-etcd-client")
    commands+=("apiserver-kubelet-client")
    commands+=("etcd-healthcheck-client")
    commands+=("etcd-peer")
    commands+=("etcd-server")
    commands+=("front-proxy-client")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs_sa()
{
    last_command="kubeadm_alpha_phase_certs_sa"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_certs()
{
    last_command="kubeadm_alpha_phase_certs"
    commands=()
    commands+=("all")
    commands+=("apiserver")
    commands+=("apiserver-etcd-client")
    commands+=("apiserver-kubelet-client")
    commands+=("ca")
    commands+=("etcd-ca")
    commands+=("etcd-healthcheck-client")
    commands+=("etcd-peer")
    commands+=("etcd-server")
    commands+=("front-proxy-ca")
    commands+=("front-proxy-client")
    commands+=("renew")
    commands+=("sa")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_controlplane_all()
{
    last_command="kubeadm_alpha_phase_controlplane_all"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--apiserver-extra-args=")
    local_nonpersistent_flags+=("--apiserver-extra-args=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--controller-manager-extra-args=")
    local_nonpersistent_flags+=("--controller-manager-extra-args=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--pod-network-cidr=")
    local_nonpersistent_flags+=("--pod-network-cidr=")
    flags+=("--scheduler-extra-args=")
    local_nonpersistent_flags+=("--scheduler-extra-args=")
    flags+=("--service-cidr=")
    local_nonpersistent_flags+=("--service-cidr=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_controlplane_apiserver()
{
    last_command="kubeadm_alpha_phase_controlplane_apiserver"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--apiserver-extra-args=")
    local_nonpersistent_flags+=("--apiserver-extra-args=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--service-cidr=")
    local_nonpersistent_flags+=("--service-cidr=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_controlplane_controller-manager()
{
    last_command="kubeadm_alpha_phase_controlplane_controller-manager"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--controller-manager-extra-args=")
    local_nonpersistent_flags+=("--controller-manager-extra-args=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--pod-network-cidr=")
    local_nonpersistent_flags+=("--pod-network-cidr=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_controlplane_scheduler()
{
    last_command="kubeadm_alpha_phase_controlplane_scheduler"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubernetes-version=")
    local_nonpersistent_flags+=("--kubernetes-version=")
    flags+=("--scheduler-extra-args=")
    local_nonpersistent_flags+=("--scheduler-extra-args=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_controlplane()
{
    last_command="kubeadm_alpha_phase_controlplane"
    commands=()
    commands+=("all")
    commands+=("apiserver")
    commands+=("controller-manager")
    commands+=("scheduler")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_etcd_local()
{
    last_command="kubeadm_alpha_phase_etcd_local"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_etcd()
{
    last_command="kubeadm_alpha_phase_etcd"
    commands=()
    commands+=("local")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig_admin()
{
    last_command="kubeadm_alpha_phase_kubeconfig_admin"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig-dir=")
    local_nonpersistent_flags+=("--kubeconfig-dir=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig_all()
{
    last_command="kubeadm_alpha_phase_kubeconfig_all"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig-dir=")
    local_nonpersistent_flags+=("--kubeconfig-dir=")
    flags+=("--node-name=")
    local_nonpersistent_flags+=("--node-name=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig_controller-manager()
{
    last_command="kubeadm_alpha_phase_kubeconfig_controller-manager"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig-dir=")
    local_nonpersistent_flags+=("--kubeconfig-dir=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig_kubelet()
{
    last_command="kubeadm_alpha_phase_kubeconfig_kubelet"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig-dir=")
    local_nonpersistent_flags+=("--kubeconfig-dir=")
    flags+=("--node-name=")
    local_nonpersistent_flags+=("--node-name=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig_scheduler()
{
    last_command="kubeadm_alpha_phase_kubeconfig_scheduler"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig-dir=")
    local_nonpersistent_flags+=("--kubeconfig-dir=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig_user()
{
    last_command="kubeadm_alpha_phase_kubeconfig_user"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    local_nonpersistent_flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    local_nonpersistent_flags+=("--apiserver-bind-port=")
    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--client-name=")
    local_nonpersistent_flags+=("--client-name=")
    flags+=("--kubeconfig-dir=")
    local_nonpersistent_flags+=("--kubeconfig-dir=")
    flags+=("--org=")
    local_nonpersistent_flags+=("--org=")
    flags+=("--token=")
    local_nonpersistent_flags+=("--token=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubeconfig()
{
    last_command="kubeadm_alpha_phase_kubeconfig"
    commands=()
    commands+=("admin")
    commands+=("all")
    commands+=("controller-manager")
    commands+=("kubelet")
    commands+=("scheduler")
    commands+=("user")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_config_annotate-cri()
{
    last_command="kubeadm_alpha_phase_kubelet_config_annotate-cri"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_config_download()
{
    last_command="kubeadm_alpha_phase_kubelet_config_download"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--kubelet-version=")
    local_nonpersistent_flags+=("--kubelet-version=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_config_enable-dynamic()
{
    last_command="kubeadm_alpha_phase_kubelet_config_enable-dynamic"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--kubelet-version=")
    local_nonpersistent_flags+=("--kubelet-version=")
    flags+=("--node-name=")
    local_nonpersistent_flags+=("--node-name=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_config_upload()
{
    last_command="kubeadm_alpha_phase_kubelet_config_upload"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_config_write-to-disk()
{
    last_command="kubeadm_alpha_phase_kubelet_config_write-to-disk"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_config()
{
    last_command="kubeadm_alpha_phase_kubelet_config"
    commands=()
    commands+=("annotate-cri")
    commands+=("download")
    commands+=("enable-dynamic")
    commands+=("upload")
    commands+=("write-to-disk")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet_write-env-file()
{
    last_command="kubeadm_alpha_phase_kubelet_write-env-file"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_kubelet()
{
    last_command="kubeadm_alpha_phase_kubelet"
    commands=()
    commands+=("config")
    commands+=("write-env-file")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_mark-master()
{
    last_command="kubeadm_alpha_phase_mark-master"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--node-name=")
    local_nonpersistent_flags+=("--node-name=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_preflight_master()
{
    last_command="kubeadm_alpha_phase_preflight_master"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    flags+=("--ignore-preflight-errors=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_preflight_node()
{
    last_command="kubeadm_alpha_phase_preflight_node"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    flags+=("--ignore-preflight-errors=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_preflight()
{
    last_command="kubeadm_alpha_phase_preflight"
    commands=()
    commands+=("master")
    commands+=("node")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    flags+=("--ignore-preflight-errors=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_selfhosting_convert-from-staticpods()
{
    last_command="kubeadm_alpha_phase_selfhosting_convert-from-staticpods"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    local_nonpersistent_flags+=("--cert-dir=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_selfhosting()
{
    last_command="kubeadm_alpha_phase_selfhosting"
    commands=()
    commands+=("convert-from-staticpods")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase_upload-config()
{
    last_command="kubeadm_alpha_phase_upload-config"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha_phase()
{
    last_command="kubeadm_alpha_phase"
    commands=()
    commands+=("addon")
    commands+=("bootstrap-token")
    commands+=("certs")
    commands+=("controlplane")
    commands+=("etcd")
    commands+=("kubeconfig")
    commands+=("kubelet")
    commands+=("mark-master")
    commands+=("preflight")
    commands+=("selfhosting")
    commands+=("upload-config")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_alpha()
{
    last_command="kubeadm_alpha"
    commands=()
    commands+=("phase")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_completion()
{
    last_command="kubeadm_completion"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("-h")
    local_nonpersistent_flags+=("--help")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("bash")
    must_have_one_noun+=("zsh")
    noun_aliases=()
}

_kubeadm_config_images_list()
{
    last_command="kubeadm_config_images_list"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    flags+=("--feature-gates=")
    flags+=("--kubernetes-version=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_images_pull()
{
    last_command="kubeadm_config_images_pull"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    flags+=("--cri-socket=")
    flags+=("--feature-gates=")
    flags+=("--kubernetes-version=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_images()
{
    last_command="kubeadm_config_images"
    commands=()
    commands+=("list")
    commands+=("pull")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_migrate()
{
    last_command="kubeadm_config_migrate"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--new-config=")
    local_nonpersistent_flags+=("--new-config=")
    flags+=("--old-config=")
    local_nonpersistent_flags+=("--old-config=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_print-default()
{
    last_command="kubeadm_config_print-default"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--api-objects=")
    local_nonpersistent_flags+=("--api-objects=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_upload_from-file()
{
    last_command="kubeadm_config_upload_from-file"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_upload_from-flags()
{
    last_command="kubeadm_config_upload_from-flags"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    flags+=("--apiserver-cert-extra-sans=")
    flags+=("--cert-dir=")
    flags+=("--cri-socket=")
    flags+=("--feature-gates=")
    flags+=("--kubernetes-version=")
    flags+=("--node-name=")
    flags+=("--pod-network-cidr=")
    flags+=("--service-cidr=")
    flags+=("--service-dns-domain=")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_upload()
{
    last_command="kubeadm_config_upload"
    commands=()
    commands+=("from-file")
    commands+=("from-flags")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config_view()
{
    last_command="kubeadm_config_view"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_config()
{
    last_command="kubeadm_config"
    commands=()
    commands+=("images")
    commands+=("migrate")
    commands+=("print-default")
    commands+=("upload")
    commands+=("view")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_init()
{
    last_command="kubeadm_init"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    flags+=("--apiserver-cert-extra-sans=")
    flags+=("--cert-dir=")
    flags+=("--config=")
    flags+=("--cri-socket=")
    flags+=("--dry-run")
    flags+=("--feature-gates=")
    flags+=("--ignore-preflight-errors=")
    flags+=("--kubernetes-version=")
    flags+=("--node-name=")
    flags+=("--pod-network-cidr=")
    flags+=("--service-cidr=")
    flags+=("--service-dns-domain=")
    flags+=("--skip-token-print")
    flags+=("--token=")
    flags+=("--token-ttl=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_join()
{
    last_command="kubeadm_join"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--apiserver-advertise-address=")
    flags+=("--apiserver-bind-port=")
    flags+=("--config=")
    flags+=("--cri-socket=")
    flags+=("--discovery-file=")
    flags+=("--discovery-token=")
    flags+=("--discovery-token-ca-cert-hash=")
    flags+=("--discovery-token-unsafe-skip-ca-verification")
    flags+=("--experimental-control-plane")
    flags+=("--feature-gates=")
    flags+=("--ignore-preflight-errors=")
    flags+=("--node-name=")
    flags+=("--tls-bootstrap-token=")
    flags+=("--token=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_reset()
{
    last_command="kubeadm_reset"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--cert-dir=")
    flags+=("--cri-socket=")
    flags+=("--force")
    flags+=("-f")
    flags+=("--ignore-preflight-errors=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_token_create()
{
    last_command="kubeadm_token_create"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--description=")
    local_nonpersistent_flags+=("--description=")
    flags+=("--groups=")
    local_nonpersistent_flags+=("--groups=")
    flags+=("--print-join-command")
    local_nonpersistent_flags+=("--print-join-command")
    flags+=("--ttl=")
    local_nonpersistent_flags+=("--ttl=")
    flags+=("--usages=")
    local_nonpersistent_flags+=("--usages=")
    flags+=("--dry-run")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_token_delete()
{
    last_command="kubeadm_token_delete"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_token_generate()
{
    last_command="kubeadm_token_generate"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_token_list()
{
    last_command="kubeadm_token_list"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_token()
{
    last_command="kubeadm_token"
    commands=()
    commands+=("create")
    commands+=("delete")
    commands+=("generate")
    commands+=("list")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade_apply()
{
    last_command="kubeadm_upgrade_apply"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-experimental-upgrades")
    local_nonpersistent_flags+=("--allow-experimental-upgrades")
    flags+=("--allow-release-candidate-upgrades")
    local_nonpersistent_flags+=("--allow-release-candidate-upgrades")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--cri-socket=")
    local_nonpersistent_flags+=("--cri-socket=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--etcd-upgrade")
    local_nonpersistent_flags+=("--etcd-upgrade")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--force")
    flags+=("-f")
    local_nonpersistent_flags+=("--force")
    flags+=("--ignore-preflight-errors=")
    local_nonpersistent_flags+=("--ignore-preflight-errors=")
    flags+=("--image-pull-timeout=")
    local_nonpersistent_flags+=("--image-pull-timeout=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--print-config")
    local_nonpersistent_flags+=("--print-config")
    flags+=("--yes")
    flags+=("-y")
    local_nonpersistent_flags+=("--yes")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade_diff()
{
    last_command="kubeadm_upgrade_diff"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--api-server-manifest=")
    local_nonpersistent_flags+=("--api-server-manifest=")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--context-lines=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--context-lines=")
    flags+=("--controller-manager-manifest=")
    local_nonpersistent_flags+=("--controller-manager-manifest=")
    flags+=("--scheduler-manifest=")
    local_nonpersistent_flags+=("--scheduler-manifest=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade_node_config()
{
    last_command="kubeadm_upgrade_node_config"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--kubelet-version=")
    local_nonpersistent_flags+=("--kubelet-version=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade_node_experimental-control-plane()
{
    last_command="kubeadm_upgrade_node_experimental-control-plane"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade_node()
{
    last_command="kubeadm_upgrade_node"
    commands=()
    commands+=("config")
    commands+=("experimental-control-plane")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade_plan()
{
    last_command="kubeadm_upgrade_plan"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-experimental-upgrades")
    local_nonpersistent_flags+=("--allow-experimental-upgrades")
    flags+=("--allow-release-candidate-upgrades")
    local_nonpersistent_flags+=("--allow-release-candidate-upgrades")
    flags+=("--config=")
    local_nonpersistent_flags+=("--config=")
    flags+=("--feature-gates=")
    local_nonpersistent_flags+=("--feature-gates=")
    flags+=("--ignore-preflight-errors=")
    local_nonpersistent_flags+=("--ignore-preflight-errors=")
    flags+=("--kubeconfig=")
    local_nonpersistent_flags+=("--kubeconfig=")
    flags+=("--print-config")
    local_nonpersistent_flags+=("--print-config")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_upgrade()
{
    last_command="kubeadm_upgrade"
    commands=()
    commands+=("apply")
    commands+=("diff")
    commands+=("node")
    commands+=("plan")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_version()
{
    last_command="kubeadm_version"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubeadm_root_command()
{
    last_command="kubeadm"
    commands=()
    commands+=("alpha")
    commands+=("completion")
    commands+=("config")
    commands+=("init")
    commands+=("join")
    commands+=("reset")
    commands+=("token")
    commands+=("upgrade")
    commands+=("version")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--rootfs=")
    flags+=("--v=")
    two_word_flags+=("-v")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

__start_kubeadm()
{
    local cur prev words cword
    declare -A flaghash 2>/dev/null || :
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __kubeadm_init_completion -n "=" || return
    fi

    local c=0
    local flags=()
    local two_word_flags=()
    local local_nonpersistent_flags=()
    local flags_with_completion=()
    local flags_completion=()
    local commands=("kubeadm")
    local must_have_one_flag=()
    local must_have_one_noun=()
    local last_command
    local nouns=()

    __kubeadm_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_kubeadm kubeadm
else
    complete -o default -o nospace -F __start_kubeadm kubeadm
fi

# ex: ts=4 sw=4 et filetype=sh

BASH_COMPLETION_EOF
}

__kubeadm_bash_source <(__kubeadm_convert_bash_to_zsh)
#compdef kubectl

# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

__kubectl_bash_source() {
	alias shopt=':'
	alias _expand=_bash_expand
	alias _complete=_bash_comp
	emulate -L sh
	setopt kshglob noshglob braceexpand

	source "$@"
}

__kubectl_type() {
	# -t is not supported by zsh
	if [ "$1" == "-t" ]; then
		shift

		# fake Bash 4 to disable "complete -o nospace". Instead
		# "compopt +-o nospace" is used in the code to toggle trailing
		# spaces. We don't support that, but leave trailing spaces on
		# all the time
		if [ "$1" = "__kubectl_compopt" ]; then
			echo builtin
			return 0
		fi
	fi
	type "$@"
}

__kubectl_compgen() {
	local completions w
	completions=( $(compgen "$@") ) || return $?

	# filter by given word as prefix
	while [[ "$1" = -* && "$1" != -- ]]; do
		shift
		shift
	done
	if [[ "$1" == -- ]]; then
		shift
	fi
	for w in "${completions[@]}"; do
		if [[ "${w}" = "$1"* ]]; then
			echo "${w}"
		fi
	done
}

__kubectl_compopt() {
	true # don't do anything. Not supported by bashcompinit in zsh
}

__kubectl_ltrim_colon_completions()
{
	if [[ "$1" == *:* && "$COMP_WORDBREAKS" == *:* ]]; then
		# Remove colon-word prefix from COMPREPLY items
		local colon_word=${1%${1##*:}}
		local i=${#COMPREPLY[*]}
		while [[ $((--i)) -ge 0 ]]; do
			COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
		done
	fi
}

__kubectl_get_comp_words_by_ref() {
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[${COMP_CWORD}-1]}"
	words=("${COMP_WORDS[@]}")
	cword=("${COMP_CWORD[@]}")
}

__kubectl_filedir() {
	local RET OLD_IFS w qw

	__kubectl_debug "_filedir $@ cur=$cur"
	if [[ "$1" = \~* ]]; then
		# somehow does not work. Maybe, zsh does not call this at all
		eval echo "$1"
		return 0
	fi

	OLD_IFS="$IFS"
	IFS=$'\n'
	if [ "$1" = "-d" ]; then
		shift
		RET=( $(compgen -d) )
	else
		RET=( $(compgen -f) )
	fi
	IFS="$OLD_IFS"

	IFS="," __kubectl_debug "RET=${RET[@]} len=${#RET[@]}"

	for w in ${RET[@]}; do
		if [[ ! "${w}" = "${cur}"* ]]; then
			continue
		fi
		if eval "[[ \"\${w}\" = *.$1 || -d \"\${w}\" ]]"; then
			qw="$(__kubectl_quote "${w}")"
			if [ -d "${w}" ]; then
				COMPREPLY+=("${qw}/")
			else
				COMPREPLY+=("${qw}")
			fi
		fi
	done
}

__kubectl_quote() {
    if [[ $1 == \'* || $1 == \"* ]]; then
        # Leave out first character
        printf %q "${1:1}"
    else
    	printf %q "$1"
    fi
}

autoload -U +X bashcompinit && bashcompinit

# use word boundary patterns for BSD or GNU sed
LWORD='[[:<:]]'
RWORD='[[:>:]]'
if sed --help 2>&1 | grep -q GNU; then
	LWORD='\<'
	RWORD='\>'
fi

__kubectl_convert_bash_to_zsh() {
	sed \
	-e 's/declare -F/whence -w/' \
	-e 's/_get_comp_words_by_ref "\$@"/_get_comp_words_by_ref "\$*"/' \
	-e 's/local \([a-zA-Z0-9_]*\)=/local \1; \1=/' \
	-e 's/flags+=("\(--.*\)=")/flags+=("\1"); two_word_flags+=("\1")/' \
	-e 's/must_have_one_flag+=("\(--.*\)=")/must_have_one_flag+=("\1")/' \
	-e "s/${LWORD}_filedir${RWORD}/__kubectl_filedir/g" \
	-e "s/${LWORD}_get_comp_words_by_ref${RWORD}/__kubectl_get_comp_words_by_ref/g" \
	-e "s/${LWORD}__ltrim_colon_completions${RWORD}/__kubectl_ltrim_colon_completions/g" \
	-e "s/${LWORD}compgen${RWORD}/__kubectl_compgen/g" \
	-e "s/${LWORD}compopt${RWORD}/__kubectl_compopt/g" \
	-e "s/${LWORD}declare${RWORD}/builtin declare/g" \
	-e "s/\\\$(type${RWORD}/\$(__kubectl_type/g" \
	<<'BASH_COMPLETION_EOF'
# bash completion for kubectl                              -*- shell-script -*-

__kubectl_debug()
{
    if [[ -n ${BASH_COMP_DEBUG_FILE} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
    fi
}

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__kubectl_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

__kubectl_index_of_word()
{
    local w word=$1
    shift
    index=0
    for w in "$@"; do
        [[ $w = "$word" ]] && return
        index=$((index+1))
    done
    index=-1
}

__kubectl_contains_word()
{
    local w word=$1; shift
    for w in "$@"; do
        [[ $w = "$word" ]] && return
    done
    return 1
}

__kubectl_handle_reply()
{
    __kubectl_debug "${FUNCNAME[0]}"
    case $cur in
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace
            fi
            local allflags
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}")
            else
                allflags=("${flags[*]} ${two_word_flags[*]}")
            fi
            COMPREPLY=( $(compgen -W "${allflags[*]}" -- "$cur") )
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace
            fi

            # complete after --flag=abc
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace
                fi

                local index flag
                flag="${cur%=*}"
                __kubectl_index_of_word "${flag}" "${flags_with_completion[@]}"
                COMPREPLY=()
                if [[ ${index} -ge 0 ]]; then
                    PREFIX=""
                    cur="${cur#*=}"
                    ${flags_completion[${index}]}
                    if [ -n "${ZSH_VERSION}" ]; then
                        # zsh completion needs --flag= prefix
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )"
                    fi
                fi
            fi
            return 0;
            ;;
    esac

    # check if we are handling a flag with special work handling
    local index
    __kubectl_index_of_word "${prev}" "${flags_with_completion[@]}"
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]}
        return
    fi

    # we are parsing a flag and don't have a special handler, no completion
    if [[ ${cur} != "${words[cword]}" ]]; then
        return
    fi

    local completions
    completions=("${commands[@]}")
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions=("${must_have_one_noun[@]}")
    fi
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}")
    fi
    COMPREPLY=( $(compgen -W "${completions[*]}" -- "$cur") )

    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        COMPREPLY=( $(compgen -W "${noun_aliases[*]}" -- "$cur") )
    fi

    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        declare -F __custom_func >/dev/null && __custom_func
    fi

    # available in bash-completion >= 2, not always present on macOS
    if declare -F __ltrim_colon_completions >/dev/null; then
        __ltrim_colon_completions "$cur"
    fi

    # If there is only 1 completion and it is a flag with an = it will be completed
    # but we don't want a space after the =
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
       compopt -o nospace
    fi
}

# The arguments should be in the form "ext1|ext2|extn"
__kubectl_handle_filename_extension_flag()
{
    local ext="$1"
    _filedir "@(${ext})"
}

__kubectl_handle_subdirs_in_dir_flag()
{
    local dir="$1"
    pushd "${dir}" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1
}

__kubectl_handle_flag()
{
    __kubectl_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    # if a command required a flag, and we found it, unset must_have_one_flag()
    local flagname=${words[c]}
    local flagvalue
    # if the word contained an =
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=} # take in as flagvalue after the =
        flagname=${flagname%=*} # strip everything after the =
        flagname="${flagname}=" # but put the = back
    fi
    __kubectl_debug "${FUNCNAME[0]}: looking for ${flagname}"
    if __kubectl_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=()
    fi

    # if you set a flag which only applies to this command, don't show subcommands
    if __kubectl_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
      commands=()
    fi

    # keep flag value with flagname as flaghash
    # flaghash variable is an associative array which is only supported in bash > 3.
    if [[ -z "${BASH_VERSION}" || "${BASH_VERSINFO[0]}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ] ; then
            flaghash[${flagname}]=${flagvalue}
        elif [ -n "${words[ $((c+1)) ]}" ] ; then
            flaghash[${flagname}]=${words[ $((c+1)) ]}
        else
            flaghash[${flagname}]="true" # pad "true" for bool flag
        fi
    fi

    # skip the argument to a two word flag
    if __kubectl_contains_word "${words[c]}" "${two_word_flags[@]}"; then
        c=$((c+1))
        # if we are looking for a flags value, don't show commands
        if [[ $c -eq $cword ]]; then
            commands=()
        fi
    fi

    c=$((c+1))

}

__kubectl_handle_noun()
{
    __kubectl_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    if __kubectl_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=()
    elif __kubectl_contains_word "${words[c]}" "${noun_aliases[@]}"; then
        must_have_one_noun=()
    fi

    nouns+=("${words[c]}")
    c=$((c+1))
}

__kubectl_handle_command()
{
    __kubectl_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"

    local next_command
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}"
    else
        if [[ $c -eq 0 ]]; then
            next_command="_kubectl_root_command"
        else
            next_command="_${words[c]//:/__}"
        fi
    fi
    c=$((c+1))
    __kubectl_debug "${FUNCNAME[0]}: looking for ${next_command}"
    declare -F "$next_command" >/dev/null && $next_command
}

__kubectl_handle_word()
{
    if [[ $c -ge $cword ]]; then
        __kubectl_handle_reply
        return
    fi
    __kubectl_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}"
    if [[ "${words[c]}" == -* ]]; then
        __kubectl_handle_flag
    elif __kubectl_contains_word "${words[c]}" "${commands[@]}"; then
        __kubectl_handle_command
    elif [[ $c -eq 0 ]]; then
        __kubectl_handle_command
    else
        __kubectl_handle_noun
    fi
    __kubectl_handle_word
}

# call kubectl get $1,
__kubectl_override_flag_list=(--kubeconfig --cluster --user --context --namespace --server -n -s)
__kubectl_override_flags()
{
    local ${__kubectl_override_flag_list[*]##*-} two_word_of of var
    for w in "${words[@]}"; do
        if [ -n "${two_word_of}" ]; then
            eval "${two_word_of##*-}=\"${two_word_of}=\${w}\""
            two_word_of=
            continue
        fi
        for of in "${__kubectl_override_flag_list[@]}"; do
            case "${w}" in
                ${of}=*)
                    eval "${of##*-}=\"${w}\""
                    ;;
                ${of})
                    two_word_of="${of}"
                    ;;
            esac
        done
    done
    for var in "${__kubectl_override_flag_list[@]##*-}"; do
        if eval "test -n \"\$${var}\""; then
            eval "echo \${${var}}"
        fi
    done
}

__kubectl_config_get_contexts()
{
    __kubectl_parse_config "contexts"
}

__kubectl_config_get_clusters()
{
    __kubectl_parse_config "clusters"
}

__kubectl_config_get_users()
{
    __kubectl_parse_config "users"
}

# $1 has to be "contexts", "clusters" or "users"
__kubectl_parse_config()
{
    local template kubectl_out
    template="{{ range .$1  }}{{ .name }} {{ end }}"
    if kubectl_out=$(kubectl config $(__kubectl_override_flags) -o template --template="${template}" view 2>/dev/null); then
        COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
    fi
}

# $1 is the name of resource (required)
# $2 is template string for kubectl get (optional)
__kubectl_parse_get()
{
    local template
    template="${2:-"{{ range .items  }}{{ .metadata.name }} {{ end }}"}"
    local kubectl_out
    if kubectl_out=$(kubectl get $(__kubectl_override_flags) -o template --template="${template}" "$1" 2>/dev/null); then
        COMPREPLY+=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
    fi
}

__kubectl_get_resource()
{
    if [[ ${#nouns[@]} -eq 0 ]]; then
      local kubectl_out
      if kubectl_out=$(kubectl api-resources $(__kubectl_override_flags) -o name --cached --request-timeout=5s --verbs=get 2>/dev/null); then
          COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
          return 0
      fi
      return 1
    fi
    __kubectl_parse_get "${nouns[${#nouns[@]} -1]}"
}

__kubectl_get_resource_namespace()
{
    __kubectl_parse_get "namespace"
}

__kubectl_get_resource_pod()
{
    __kubectl_parse_get "pod"
}

__kubectl_get_resource_rc()
{
    __kubectl_parse_get "rc"
}

__kubectl_get_resource_node()
{
    __kubectl_parse_get "node"
}

__kubectl_get_resource_clusterrole()
{
    __kubectl_parse_get "clusterrole"
}

# $1 is the name of the pod we want to get the list of containers inside
__kubectl_get_containers()
{
    local template
    template="{{ range .spec.initContainers }}{{ .name }} {{end}}{{ range .spec.containers  }}{{ .name }} {{ end }}"
    __kubectl_debug "${FUNCNAME} nouns are ${nouns[*]}"

    local len="${#nouns[@]}"
    if [[ ${len} -ne 1 ]]; then
        return
    fi
    local last=${nouns[${len} -1]}
    local kubectl_out
    if kubectl_out=$(kubectl get $(__kubectl_override_flags) -o template --template="${template}" pods "${last}" 2>/dev/null); then
        COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
    fi
}

# Require both a pod and a container to be specified
__kubectl_require_pod_and_container()
{
    if [[ ${#nouns[@]} -eq 0 ]]; then
        __kubectl_parse_get pods
        return 0
    fi;
    __kubectl_get_containers
    return 0
}

__kubectl_cp()
{
    if [[ $(type -t compopt) = "builtin" ]]; then
        compopt -o nospace
    fi

    case "$cur" in
        /*|[.~]*) # looks like a path
            return
            ;;
        *:*) # TODO: complete remote files in the pod
            return
            ;;
        */*) # complete <namespace>/<pod>
            local template namespace kubectl_out
            template="{{ range .items }}{{ .metadata.namespace }}/{{ .metadata.name }}: {{ end }}"
            namespace="${cur%%/*}"
            if kubectl_out=( $(kubectl get $(__kubectl_override_flags) --namespace "${namespace}" -o template --template="${template}" pods 2>/dev/null) ); then
                COMPREPLY=( $(compgen -W "${kubectl_out[*]}" -- "${cur}") )
            fi
            return
            ;;
        *) # complete namespaces, pods, and filedirs
            __kubectl_parse_get "namespace" "{{ range .items  }}{{ .metadata.name }}/ {{ end }}"
            __kubectl_parse_get "pod" "{{ range .items  }}{{ .metadata.name }}: {{ end }}"
            _filedir
            ;;
    esac
}

__custom_func() {
    case ${last_command} in
        kubectl_get | kubectl_describe | kubectl_delete | kubectl_label | kubectl_edit | kubectl_patch |\
        kubectl_annotate | kubectl_expose | kubectl_scale | kubectl_autoscale | kubectl_taint | kubectl_rollout_* |\
        kubectl_apply_edit-last-applied | kubectl_apply_view-last-applied)
            __kubectl_get_resource
            return
            ;;
        kubectl_logs | kubectl_attach)
            __kubectl_require_pod_and_container
            return
            ;;
        kubectl_exec | kubectl_port-forward | kubectl_top_pod)
            __kubectl_get_resource_pod
            return
            ;;
        kubectl_rolling-update)
            __kubectl_get_resource_rc
            return
            ;;
        kubectl_cordon | kubectl_uncordon | kubectl_drain | kubectl_top_node)
            __kubectl_get_resource_node
            return
            ;;
        kubectl_config_use-context | kubectl_config_rename-context)
            __kubectl_config_get_contexts
            return
            ;;
        kubectl_config_delete-cluster)
            __kubectl_config_get_clusters
            return
            ;;
        kubectl_cp)
            __kubectl_cp
            return
            ;;
        *)
            ;;
    esac
}

_kubectl_alpha_diff()
{
    last_command="kubectl_alpha_diff"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--filename=")
    must_have_one_flag+=("-f")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_alpha()
{
    last_command="kubectl_alpha"
    commands=()
    commands+=("diff")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_annotate()
{
    last_command="kubectl_annotate"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--field-selector=")
    local_nonpersistent_flags+=("--field-selector=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--resource-version=")
    local_nonpersistent_flags+=("--resource-version=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_api-resources()
{
    last_command="kubectl_api-resources"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--api-group=")
    local_nonpersistent_flags+=("--api-group=")
    flags+=("--cached")
    local_nonpersistent_flags+=("--cached")
    flags+=("--namespaced")
    local_nonpersistent_flags+=("--namespaced")
    flags+=("--no-headers")
    local_nonpersistent_flags+=("--no-headers")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--verbs=")
    local_nonpersistent_flags+=("--verbs=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_api-versions()
{
    last_command="kubectl_api-versions"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_apply_edit-last-applied()
{
    last_command="kubectl_apply_edit-last-applied"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--windows-line-endings")
    local_nonpersistent_flags+=("--windows-line-endings")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_apply_set-last-applied()
{
    last_command="kubectl_apply_set-last-applied"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--create-annotation")
    local_nonpersistent_flags+=("--create-annotation")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_apply_view-last-applied()
{
    last_command="kubectl_apply_view-last-applied"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_apply()
{
    last_command="kubectl_apply"
    commands=()
    commands+=("edit-last-applied")
    commands+=("set-last-applied")
    commands+=("view-last-applied")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--cascade")
    local_nonpersistent_flags+=("--cascade")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--grace-period=")
    local_nonpersistent_flags+=("--grace-period=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--openapi-patch")
    local_nonpersistent_flags+=("--openapi-patch")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--prune")
    local_nonpersistent_flags+=("--prune")
    flags+=("--prune-whitelist=")
    local_nonpersistent_flags+=("--prune-whitelist=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--server-dry-run")
    local_nonpersistent_flags+=("--server-dry-run")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--filename=")
    must_have_one_flag+=("-f")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_attach()
{
    last_command="kubectl_attach"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--container=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--container=")
    flags+=("--pod-running-timeout=")
    local_nonpersistent_flags+=("--pod-running-timeout=")
    flags+=("--stdin")
    flags+=("-i")
    local_nonpersistent_flags+=("--stdin")
    flags+=("--tty")
    flags+=("-t")
    local_nonpersistent_flags+=("--tty")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_auth_can-i()
{
    last_command="kubectl_auth_can-i"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    local_nonpersistent_flags+=("--all-namespaces")
    flags+=("--quiet")
    flags+=("-q")
    local_nonpersistent_flags+=("--quiet")
    flags+=("--subresource=")
    local_nonpersistent_flags+=("--subresource=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_auth_reconcile()
{
    last_command="kubectl_auth_reconcile"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--remove-extra-permissions")
    local_nonpersistent_flags+=("--remove-extra-permissions")
    flags+=("--remove-extra-subjects")
    local_nonpersistent_flags+=("--remove-extra-subjects")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--filename=")
    must_have_one_flag+=("-f")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_auth()
{
    last_command="kubectl_auth"
    commands=()
    commands+=("can-i")
    commands+=("reconcile")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_autoscale()
{
    last_command="kubectl_autoscale"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--cpu-percent=")
    local_nonpersistent_flags+=("--cpu-percent=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--max=")
    local_nonpersistent_flags+=("--max=")
    flags+=("--min=")
    local_nonpersistent_flags+=("--min=")
    flags+=("--name=")
    local_nonpersistent_flags+=("--name=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--max=")
    must_have_one_noun=()
    must_have_one_noun+=("deployment")
    must_have_one_noun+=("replicaset")
    must_have_one_noun+=("replicationcontroller")
    noun_aliases=()
}

_kubectl_certificate_approve()
{
    last_command="kubectl_certificate_approve"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_certificate_deny()
{
    last_command="kubectl_certificate_deny"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_certificate()
{
    last_command="kubectl_certificate"
    commands=()
    commands+=("approve")
    commands+=("deny")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_cluster-info_dump()
{
    last_command="kubectl_cluster-info_dump"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    local_nonpersistent_flags+=("--all-namespaces")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--namespaces=")
    local_nonpersistent_flags+=("--namespaces=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--output-directory=")
    local_nonpersistent_flags+=("--output-directory=")
    flags+=("--pod-running-timeout=")
    local_nonpersistent_flags+=("--pod-running-timeout=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_cluster-info()
{
    last_command="kubectl_cluster-info"
    commands=()
    commands+=("dump")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_completion()
{
    last_command="kubectl_completion"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--help")
    flags+=("-h")
    local_nonpersistent_flags+=("--help")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("bash")
    must_have_one_noun+=("zsh")
    noun_aliases=()
}

_kubectl_config_current-context()
{
    last_command="kubectl_config_current-context"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_delete-cluster()
{
    last_command="kubectl_config_delete-cluster"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_delete-context()
{
    last_command="kubectl_config_delete-context"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_get-clusters()
{
    last_command="kubectl_config_get-clusters"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_get-contexts()
{
    last_command="kubectl_config_get-contexts"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--no-headers")
    local_nonpersistent_flags+=("--no-headers")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_rename-context()
{
    last_command="kubectl_config_rename-context"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_set()
{
    last_command="kubectl_config_set"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--set-raw-bytes")
    local_nonpersistent_flags+=("--set-raw-bytes")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_set-cluster()
{
    last_command="kubectl_config_set-cluster"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--embed-certs")
    local_nonpersistent_flags+=("--embed-certs")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_set-context()
{
    last_command="kubectl_config_set-context"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--current")
    local_nonpersistent_flags+=("--current")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_set-credentials()
{
    last_command="kubectl_config_set-credentials"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--auth-provider=")
    local_nonpersistent_flags+=("--auth-provider=")
    flags+=("--auth-provider-arg=")
    local_nonpersistent_flags+=("--auth-provider-arg=")
    flags+=("--embed-certs")
    local_nonpersistent_flags+=("--embed-certs")
    flags+=("--password=")
    local_nonpersistent_flags+=("--password=")
    flags+=("--username=")
    local_nonpersistent_flags+=("--username=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_unset()
{
    last_command="kubectl_config_unset"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_use-context()
{
    last_command="kubectl_config_use-context"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config_view()
{
    last_command="kubectl_config_view"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--flatten")
    local_nonpersistent_flags+=("--flatten")
    flags+=("--merge")
    local_nonpersistent_flags+=("--merge")
    flags+=("--minify")
    local_nonpersistent_flags+=("--minify")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--raw")
    local_nonpersistent_flags+=("--raw")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_config()
{
    last_command="kubectl_config"
    commands=()
    commands+=("current-context")
    commands+=("delete-cluster")
    commands+=("delete-context")
    commands+=("get-clusters")
    commands+=("get-contexts")
    commands+=("rename-context")
    commands+=("set")
    commands+=("set-cluster")
    commands+=("set-context")
    commands+=("set-credentials")
    commands+=("unset")
    commands+=("use-context")
    commands+=("view")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_convert()
{
    last_command="kubectl_convert"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--output-version=")
    local_nonpersistent_flags+=("--output-version=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--filename=")
    must_have_one_flag+=("-f")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_cordon()
{
    last_command="kubectl_cordon"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_cp()
{
    last_command="kubectl_cp"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--container=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--container=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_clusterrole()
{
    last_command="kubectl_create_clusterrole"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--aggregation-rule=")
    local_nonpersistent_flags+=("--aggregation-rule=")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--non-resource-url=")
    local_nonpersistent_flags+=("--non-resource-url=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--resource=")
    local_nonpersistent_flags+=("--resource=")
    flags+=("--resource-name=")
    local_nonpersistent_flags+=("--resource-name=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--verb=")
    local_nonpersistent_flags+=("--verb=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_clusterrolebinding()
{
    last_command="kubectl_create_clusterrolebinding"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--clusterrole=")
    flags_with_completion+=("--clusterrole")
    flags_completion+=("__kubectl_get_resource_clusterrole")
    local_nonpersistent_flags+=("--clusterrole=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--group=")
    local_nonpersistent_flags+=("--group=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--serviceaccount=")
    local_nonpersistent_flags+=("--serviceaccount=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_configmap()
{
    last_command="kubectl_create_configmap"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--append-hash")
    local_nonpersistent_flags+=("--append-hash")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--from-env-file=")
    local_nonpersistent_flags+=("--from-env-file=")
    flags+=("--from-file=")
    local_nonpersistent_flags+=("--from-file=")
    flags+=("--from-literal=")
    local_nonpersistent_flags+=("--from-literal=")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_deployment()
{
    last_command="kubectl_create_deployment"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--image=")
    local_nonpersistent_flags+=("--image=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--image=")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_job()
{
    last_command="kubectl_create_job"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--from=")
    local_nonpersistent_flags+=("--from=")
    flags+=("--image=")
    local_nonpersistent_flags+=("--image=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_namespace()
{
    last_command="kubectl_create_namespace"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_poddisruptionbudget()
{
    last_command="kubectl_create_poddisruptionbudget"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--max-unavailable=")
    local_nonpersistent_flags+=("--max-unavailable=")
    flags+=("--min-available=")
    local_nonpersistent_flags+=("--min-available=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--selector=")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_priorityclass()
{
    last_command="kubectl_create_priorityclass"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--description=")
    local_nonpersistent_flags+=("--description=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--global-default")
    local_nonpersistent_flags+=("--global-default")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--value=")
    local_nonpersistent_flags+=("--value=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_quota()
{
    last_command="kubectl_create_quota"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--hard=")
    local_nonpersistent_flags+=("--hard=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--scopes=")
    local_nonpersistent_flags+=("--scopes=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_role()
{
    last_command="kubectl_create_role"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--resource=")
    local_nonpersistent_flags+=("--resource=")
    flags+=("--resource-name=")
    local_nonpersistent_flags+=("--resource-name=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--verb=")
    local_nonpersistent_flags+=("--verb=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_rolebinding()
{
    last_command="kubectl_create_rolebinding"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--clusterrole=")
    local_nonpersistent_flags+=("--clusterrole=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--group=")
    local_nonpersistent_flags+=("--group=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--role=")
    local_nonpersistent_flags+=("--role=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--serviceaccount=")
    local_nonpersistent_flags+=("--serviceaccount=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_secret_docker-registry()
{
    last_command="kubectl_create_secret_docker-registry"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--append-hash")
    local_nonpersistent_flags+=("--append-hash")
    flags+=("--docker-email=")
    local_nonpersistent_flags+=("--docker-email=")
    flags+=("--docker-password=")
    local_nonpersistent_flags+=("--docker-password=")
    flags+=("--docker-server=")
    local_nonpersistent_flags+=("--docker-server=")
    flags+=("--docker-username=")
    local_nonpersistent_flags+=("--docker-username=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--from-file=")
    local_nonpersistent_flags+=("--from-file=")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--docker-password=")
    must_have_one_flag+=("--docker-username=")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_secret_generic()
{
    last_command="kubectl_create_secret_generic"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--append-hash")
    local_nonpersistent_flags+=("--append-hash")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--from-env-file=")
    local_nonpersistent_flags+=("--from-env-file=")
    flags+=("--from-file=")
    local_nonpersistent_flags+=("--from-file=")
    flags+=("--from-literal=")
    local_nonpersistent_flags+=("--from-literal=")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--type=")
    local_nonpersistent_flags+=("--type=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_secret_tls()
{
    last_command="kubectl_create_secret_tls"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--append-hash")
    local_nonpersistent_flags+=("--append-hash")
    flags+=("--cert=")
    local_nonpersistent_flags+=("--cert=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--key=")
    local_nonpersistent_flags+=("--key=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_secret()
{
    last_command="kubectl_create_secret"
    commands=()
    commands+=("docker-registry")
    commands+=("generic")
    commands+=("tls")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_service_clusterip()
{
    last_command="kubectl_create_service_clusterip"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--clusterip=")
    local_nonpersistent_flags+=("--clusterip=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--tcp=")
    local_nonpersistent_flags+=("--tcp=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_service_externalname()
{
    last_command="kubectl_create_service_externalname"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--external-name=")
    local_nonpersistent_flags+=("--external-name=")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--tcp=")
    local_nonpersistent_flags+=("--tcp=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--external-name=")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_service_loadbalancer()
{
    last_command="kubectl_create_service_loadbalancer"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--tcp=")
    local_nonpersistent_flags+=("--tcp=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_service_nodeport()
{
    last_command="kubectl_create_service_nodeport"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--node-port=")
    local_nonpersistent_flags+=("--node-port=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--tcp=")
    local_nonpersistent_flags+=("--tcp=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_service()
{
    last_command="kubectl_create_service"
    commands=()
    commands+=("clusterip")
    commands+=("externalname")
    commands+=("loadbalancer")
    commands+=("nodeport")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create_serviceaccount()
{
    last_command="kubectl_create_serviceaccount"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_create()
{
    last_command="kubectl_create"
    commands=()
    commands+=("clusterrole")
    commands+=("clusterrolebinding")
    commands+=("configmap")
    commands+=("deployment")
    commands+=("job")
    commands+=("namespace")
    commands+=("poddisruptionbudget")
    commands+=("priorityclass")
    commands+=("quota")
    commands+=("role")
    commands+=("rolebinding")
    commands+=("secret")
    commands+=("service")
    commands+=("serviceaccount")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--edit")
    local_nonpersistent_flags+=("--edit")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--raw=")
    local_nonpersistent_flags+=("--raw=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--windows-line-endings")
    local_nonpersistent_flags+=("--windows-line-endings")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--filename=")
    must_have_one_flag+=("-f")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_delete()
{
    last_command="kubectl_delete"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--cascade")
    local_nonpersistent_flags+=("--cascade")
    flags+=("--field-selector=")
    local_nonpersistent_flags+=("--field-selector=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--grace-period=")
    local_nonpersistent_flags+=("--grace-period=")
    flags+=("--ignore-not-found")
    local_nonpersistent_flags+=("--ignore-not-found")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--now")
    local_nonpersistent_flags+=("--now")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_describe()
{
    last_command="kubectl_describe"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    local_nonpersistent_flags+=("--all-namespaces")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--show-events")
    local_nonpersistent_flags+=("--show-events")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_drain()
{
    last_command="kubectl_drain"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--delete-local-data")
    local_nonpersistent_flags+=("--delete-local-data")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--grace-period=")
    local_nonpersistent_flags+=("--grace-period=")
    flags+=("--ignore-daemonsets")
    local_nonpersistent_flags+=("--ignore-daemonsets")
    flags+=("--pod-selector=")
    local_nonpersistent_flags+=("--pod-selector=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_edit()
{
    last_command="kubectl_edit"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--output-patch")
    local_nonpersistent_flags+=("--output-patch")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--windows-line-endings")
    local_nonpersistent_flags+=("--windows-line-endings")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_exec()
{
    last_command="kubectl_exec"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--container=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--container=")
    flags+=("--stdin")
    flags+=("-i")
    local_nonpersistent_flags+=("--stdin")
    flags+=("--tty")
    flags+=("-t")
    local_nonpersistent_flags+=("--tty")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_explain()
{
    last_command="kubectl_explain"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--api-version=")
    local_nonpersistent_flags+=("--api-version=")
    flags+=("--recursive")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_expose()
{
    last_command="kubectl_expose"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--cluster-ip=")
    local_nonpersistent_flags+=("--cluster-ip=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--external-ip=")
    local_nonpersistent_flags+=("--external-ip=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--labels=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--labels=")
    flags+=("--load-balancer-ip=")
    local_nonpersistent_flags+=("--load-balancer-ip=")
    flags+=("--name=")
    local_nonpersistent_flags+=("--name=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overrides=")
    local_nonpersistent_flags+=("--overrides=")
    flags+=("--port=")
    local_nonpersistent_flags+=("--port=")
    flags+=("--protocol=")
    local_nonpersistent_flags+=("--protocol=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--selector=")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--session-affinity=")
    local_nonpersistent_flags+=("--session-affinity=")
    flags+=("--target-port=")
    local_nonpersistent_flags+=("--target-port=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--type=")
    local_nonpersistent_flags+=("--type=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("deployment")
    must_have_one_noun+=("pod")
    must_have_one_noun+=("replicaset")
    must_have_one_noun+=("replicationcontroller")
    must_have_one_noun+=("service")
    noun_aliases=()
}

_kubectl_get()
{
    last_command="kubectl_get"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    local_nonpersistent_flags+=("--all-namespaces")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--chunk-size=")
    local_nonpersistent_flags+=("--chunk-size=")
    flags+=("--export")
    local_nonpersistent_flags+=("--export")
    flags+=("--field-selector=")
    local_nonpersistent_flags+=("--field-selector=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--ignore-not-found")
    local_nonpersistent_flags+=("--ignore-not-found")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--label-columns=")
    two_word_flags+=("-L")
    local_nonpersistent_flags+=("--label-columns=")
    flags+=("--no-headers")
    local_nonpersistent_flags+=("--no-headers")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--raw=")
    local_nonpersistent_flags+=("--raw=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--server-print")
    local_nonpersistent_flags+=("--server-print")
    flags+=("--show-kind")
    local_nonpersistent_flags+=("--show-kind")
    flags+=("--show-labels")
    local_nonpersistent_flags+=("--show-labels")
    flags+=("--sort-by=")
    local_nonpersistent_flags+=("--sort-by=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--watch")
    flags+=("-w")
    local_nonpersistent_flags+=("--watch")
    flags+=("--watch-only")
    local_nonpersistent_flags+=("--watch-only")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_label()
{
    last_command="kubectl_label"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--field-selector=")
    local_nonpersistent_flags+=("--field-selector=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--list")
    local_nonpersistent_flags+=("--list")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--resource-version=")
    local_nonpersistent_flags+=("--resource-version=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_logs()
{
    last_command="kubectl_logs"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-containers")
    local_nonpersistent_flags+=("--all-containers")
    flags+=("--container=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--container=")
    flags+=("--follow")
    flags+=("-f")
    local_nonpersistent_flags+=("--follow")
    flags+=("--limit-bytes=")
    local_nonpersistent_flags+=("--limit-bytes=")
    flags+=("--pod-running-timeout=")
    local_nonpersistent_flags+=("--pod-running-timeout=")
    flags+=("--previous")
    flags+=("-p")
    local_nonpersistent_flags+=("--previous")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--since=")
    local_nonpersistent_flags+=("--since=")
    flags+=("--since-time=")
    local_nonpersistent_flags+=("--since-time=")
    flags+=("--tail=")
    local_nonpersistent_flags+=("--tail=")
    flags+=("--timestamps")
    local_nonpersistent_flags+=("--timestamps")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_options()
{
    last_command="kubectl_options"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_patch()
{
    last_command="kubectl_patch"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--patch=")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--patch=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--type=")
    local_nonpersistent_flags+=("--type=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--patch=")
    must_have_one_flag+=("-p")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_plugin_list()
{
    last_command="kubectl_plugin_list"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--name-only")
    local_nonpersistent_flags+=("--name-only")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_plugin()
{
    last_command="kubectl_plugin"
    commands=()
    commands+=("list")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_port-forward()
{
    last_command="kubectl_port-forward"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--pod-running-timeout=")
    local_nonpersistent_flags+=("--pod-running-timeout=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_proxy()
{
    last_command="kubectl_proxy"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--accept-hosts=")
    local_nonpersistent_flags+=("--accept-hosts=")
    flags+=("--accept-paths=")
    local_nonpersistent_flags+=("--accept-paths=")
    flags+=("--address=")
    local_nonpersistent_flags+=("--address=")
    flags+=("--api-prefix=")
    local_nonpersistent_flags+=("--api-prefix=")
    flags+=("--disable-filter")
    local_nonpersistent_flags+=("--disable-filter")
    flags+=("--keepalive=")
    local_nonpersistent_flags+=("--keepalive=")
    flags+=("--port=")
    two_word_flags+=("-p")
    local_nonpersistent_flags+=("--port=")
    flags+=("--reject-methods=")
    local_nonpersistent_flags+=("--reject-methods=")
    flags+=("--reject-paths=")
    local_nonpersistent_flags+=("--reject-paths=")
    flags+=("--unix-socket=")
    two_word_flags+=("-u")
    local_nonpersistent_flags+=("--unix-socket=")
    flags+=("--www=")
    two_word_flags+=("-w")
    local_nonpersistent_flags+=("--www=")
    flags+=("--www-prefix=")
    two_word_flags+=("-P")
    local_nonpersistent_flags+=("--www-prefix=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_replace()
{
    last_command="kubectl_replace"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--cascade")
    local_nonpersistent_flags+=("--cascade")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--grace-period=")
    local_nonpersistent_flags+=("--grace-period=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--filename=")
    must_have_one_flag+=("-f")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_rollout_history()
{
    last_command="kubectl_rollout_history"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--revision=")
    local_nonpersistent_flags+=("--revision=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("daemonset")
    must_have_one_noun+=("deployment")
    must_have_one_noun+=("statefulset")
    noun_aliases=()
}

_kubectl_rollout_pause()
{
    last_command="kubectl_rollout_pause"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("deployment")
    noun_aliases=()
}

_kubectl_rollout_resume()
{
    last_command="kubectl_rollout_resume"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("deployment")
    noun_aliases=()
}

_kubectl_rollout_status()
{
    last_command="kubectl_rollout_status"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--revision=")
    local_nonpersistent_flags+=("--revision=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--watch")
    flags+=("-w")
    local_nonpersistent_flags+=("--watch")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("daemonset")
    must_have_one_noun+=("deployment")
    must_have_one_noun+=("statefulset")
    noun_aliases=()
}

_kubectl_rollout_undo()
{
    last_command="kubectl_rollout_undo"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--to-revision=")
    local_nonpersistent_flags+=("--to-revision=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("daemonset")
    must_have_one_noun+=("deployment")
    must_have_one_noun+=("statefulset")
    noun_aliases=()
}

_kubectl_rollout()
{
    last_command="kubectl_rollout"
    commands=()
    commands+=("history")
    commands+=("pause")
    commands+=("resume")
    commands+=("status")
    commands+=("undo")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_run()
{
    last_command="kubectl_run"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--attach")
    local_nonpersistent_flags+=("--attach")
    flags+=("--cascade")
    local_nonpersistent_flags+=("--cascade")
    flags+=("--command")
    local_nonpersistent_flags+=("--command")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--env=")
    local_nonpersistent_flags+=("--env=")
    flags+=("--expose")
    local_nonpersistent_flags+=("--expose")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--force")
    local_nonpersistent_flags+=("--force")
    flags+=("--generator=")
    local_nonpersistent_flags+=("--generator=")
    flags+=("--grace-period=")
    local_nonpersistent_flags+=("--grace-period=")
    flags+=("--hostport=")
    local_nonpersistent_flags+=("--hostport=")
    flags+=("--image=")
    local_nonpersistent_flags+=("--image=")
    flags+=("--image-pull-policy=")
    local_nonpersistent_flags+=("--image-pull-policy=")
    flags+=("--labels=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--labels=")
    flags+=("--leave-stdin-open")
    local_nonpersistent_flags+=("--leave-stdin-open")
    flags+=("--limits=")
    local_nonpersistent_flags+=("--limits=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overrides=")
    local_nonpersistent_flags+=("--overrides=")
    flags+=("--pod-running-timeout=")
    local_nonpersistent_flags+=("--pod-running-timeout=")
    flags+=("--port=")
    local_nonpersistent_flags+=("--port=")
    flags+=("--quiet")
    local_nonpersistent_flags+=("--quiet")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--replicas=")
    two_word_flags+=("-r")
    local_nonpersistent_flags+=("--replicas=")
    flags+=("--requests=")
    local_nonpersistent_flags+=("--requests=")
    flags+=("--restart=")
    local_nonpersistent_flags+=("--restart=")
    flags+=("--rm")
    local_nonpersistent_flags+=("--rm")
    flags+=("--save-config")
    local_nonpersistent_flags+=("--save-config")
    flags+=("--schedule=")
    local_nonpersistent_flags+=("--schedule=")
    flags+=("--service-generator=")
    local_nonpersistent_flags+=("--service-generator=")
    flags+=("--service-overrides=")
    local_nonpersistent_flags+=("--service-overrides=")
    flags+=("--serviceaccount=")
    local_nonpersistent_flags+=("--serviceaccount=")
    flags+=("--stdin")
    flags+=("-i")
    local_nonpersistent_flags+=("--stdin")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--tty")
    flags+=("-t")
    local_nonpersistent_flags+=("--tty")
    flags+=("--wait")
    local_nonpersistent_flags+=("--wait")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--image=")
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_scale()
{
    last_command="kubectl_scale"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--current-replicas=")
    local_nonpersistent_flags+=("--current-replicas=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--replicas=")
    local_nonpersistent_flags+=("--replicas=")
    flags+=("--resource-version=")
    local_nonpersistent_flags+=("--resource-version=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_flag+=("--replicas=")
    must_have_one_noun=()
    must_have_one_noun+=("deployment")
    must_have_one_noun+=("replicaset")
    must_have_one_noun+=("replicationcontroller")
    must_have_one_noun+=("statefulset")
    noun_aliases=()
}

_kubectl_set_env()
{
    last_command="kubectl_set_env"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--containers=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--containers=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--env=")
    two_word_flags+=("-e")
    local_nonpersistent_flags+=("--env=")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--from=")
    local_nonpersistent_flags+=("--from=")
    flags+=("--keys=")
    local_nonpersistent_flags+=("--keys=")
    flags+=("--list")
    local_nonpersistent_flags+=("--list")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--prefix=")
    local_nonpersistent_flags+=("--prefix=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--resolve")
    local_nonpersistent_flags+=("--resolve")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_set_image()
{
    last_command="kubectl_set_image"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_set_resources()
{
    last_command="kubectl_set_resources"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--containers=")
    two_word_flags+=("-c")
    local_nonpersistent_flags+=("--containers=")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--limits=")
    local_nonpersistent_flags+=("--limits=")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--requests=")
    local_nonpersistent_flags+=("--requests=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_set_selector()
{
    last_command="kubectl_set_selector"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--resource-version=")
    local_nonpersistent_flags+=("--resource-version=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_set_serviceaccount()
{
    last_command="kubectl_set_serviceaccount"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--record")
    local_nonpersistent_flags+=("--record")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_set_subject()
{
    last_command="kubectl_set_subject"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--group=")
    local_nonpersistent_flags+=("--group=")
    flags+=("--include-uninitialized")
    local_nonpersistent_flags+=("--include-uninitialized")
    flags+=("--local")
    local_nonpersistent_flags+=("--local")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--serviceaccount=")
    local_nonpersistent_flags+=("--serviceaccount=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_set()
{
    last_command="kubectl_set"
    commands=()
    commands+=("env")
    commands+=("image")
    commands+=("resources")
    commands+=("selector")
    commands+=("serviceaccount")
    commands+=("subject")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_taint()
{
    last_command="kubectl_taint"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all")
    local_nonpersistent_flags+=("--all")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--overwrite")
    local_nonpersistent_flags+=("--overwrite")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--validate")
    local_nonpersistent_flags+=("--validate")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    must_have_one_noun+=("node")
    noun_aliases=()
}

_kubectl_top_node()
{
    last_command="kubectl_top_node"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--heapster-namespace=")
    local_nonpersistent_flags+=("--heapster-namespace=")
    flags+=("--heapster-port=")
    local_nonpersistent_flags+=("--heapster-port=")
    flags+=("--heapster-scheme=")
    local_nonpersistent_flags+=("--heapster-scheme=")
    flags+=("--heapster-service=")
    local_nonpersistent_flags+=("--heapster-service=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_top_pod()
{
    last_command="kubectl_top_pod"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    local_nonpersistent_flags+=("--all-namespaces")
    flags+=("--containers")
    local_nonpersistent_flags+=("--containers")
    flags+=("--heapster-namespace=")
    local_nonpersistent_flags+=("--heapster-namespace=")
    flags+=("--heapster-port=")
    local_nonpersistent_flags+=("--heapster-port=")
    flags+=("--heapster-scheme=")
    local_nonpersistent_flags+=("--heapster-scheme=")
    flags+=("--heapster-service=")
    local_nonpersistent_flags+=("--heapster-service=")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_top()
{
    last_command="kubectl_top"
    commands=()
    commands+=("node")
    commands+=("pod")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_uncordon()
{
    last_command="kubectl_uncordon"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--dry-run")
    local_nonpersistent_flags+=("--dry-run")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_version()
{
    last_command="kubectl_version"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--client")
    local_nonpersistent_flags+=("--client")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--short")
    local_nonpersistent_flags+=("--short")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_wait()
{
    last_command="kubectl_wait"
    commands=()

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--all-namespaces")
    local_nonpersistent_flags+=("--all-namespaces")
    flags+=("--allow-missing-template-keys")
    local_nonpersistent_flags+=("--allow-missing-template-keys")
    flags+=("--filename=")
    flags_with_completion+=("--filename")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    two_word_flags+=("-f")
    flags_with_completion+=("-f")
    flags_completion+=("__kubectl_handle_filename_extension_flag json|yaml|yml")
    local_nonpersistent_flags+=("--filename=")
    flags+=("--for=")
    local_nonpersistent_flags+=("--for=")
    flags+=("--output=")
    two_word_flags+=("-o")
    local_nonpersistent_flags+=("--output=")
    flags+=("--recursive")
    flags+=("-R")
    local_nonpersistent_flags+=("--recursive")
    flags+=("--selector=")
    two_word_flags+=("-l")
    local_nonpersistent_flags+=("--selector=")
    flags+=("--template=")
    flags_with_completion+=("--template")
    flags_completion+=("_filedir")
    local_nonpersistent_flags+=("--template=")
    flags+=("--timeout=")
    local_nonpersistent_flags+=("--timeout=")
    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

_kubectl_root_command()
{
    last_command="kubectl"
    commands=()
    commands+=("alpha")
    commands+=("annotate")
    commands+=("api-resources")
    commands+=("api-versions")
    commands+=("apply")
    commands+=("attach")
    commands+=("auth")
    commands+=("autoscale")
    commands+=("certificate")
    commands+=("cluster-info")
    commands+=("completion")
    commands+=("config")
    commands+=("convert")
    commands+=("cordon")
    commands+=("cp")
    commands+=("create")
    commands+=("delete")
    commands+=("describe")
    commands+=("drain")
    commands+=("edit")
    commands+=("exec")
    commands+=("explain")
    commands+=("expose")
    commands+=("get")
    commands+=("label")
    commands+=("logs")
    commands+=("options")
    commands+=("patch")
    commands+=("plugin")
    commands+=("port-forward")
    commands+=("proxy")
    commands+=("replace")
    commands+=("rollout")
    commands+=("run")
    commands+=("scale")
    commands+=("set")
    commands+=("taint")
    commands+=("top")
    commands+=("uncordon")
    commands+=("version")
    commands+=("wait")

    flags=()
    two_word_flags=()
    local_nonpersistent_flags=()
    flags_with_completion=()
    flags_completion=()

    flags+=("--alsologtostderr")
    flags+=("--as=")
    flags+=("--as-group=")
    flags+=("--cache-dir=")
    flags+=("--certificate-authority=")
    flags+=("--client-certificate=")
    flags+=("--client-key=")
    flags+=("--cluster=")
    flags_with_completion+=("--cluster")
    flags_completion+=("__kubectl_config_get_clusters")
    flags+=("--context=")
    flags_with_completion+=("--context")
    flags_completion+=("__kubectl_config_get_contexts")
    flags+=("--insecure-skip-tls-verify")
    flags+=("--kubeconfig=")
    flags+=("--log-backtrace-at=")
    flags+=("--log-dir=")
    flags+=("--log-flush-frequency=")
    flags+=("--logtostderr")
    flags+=("--match-server-version")
    flags+=("--namespace=")
    flags_with_completion+=("--namespace")
    flags_completion+=("__kubectl_get_resource_namespace")
    two_word_flags+=("-n")
    flags_with_completion+=("-n")
    flags_completion+=("__kubectl_get_resource_namespace")
    flags+=("--request-timeout=")
    flags+=("--server=")
    two_word_flags+=("-s")
    flags+=("--stderrthreshold=")
    flags+=("--token=")
    flags+=("--user=")
    flags_with_completion+=("--user")
    flags_completion+=("__kubectl_config_get_users")
    flags+=("--v=")
    two_word_flags+=("-v")
    flags+=("--vmodule=")

    must_have_one_flag=()
    must_have_one_noun=()
    noun_aliases=()
}

__start_kubectl()
{
    local cur prev words cword
    declare -A flaghash 2>/dev/null || :
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __kubectl_init_completion -n "=" || return
    fi

    local c=0
    local flags=()
    local two_word_flags=()
    local local_nonpersistent_flags=()
    local flags_with_completion=()
    local flags_completion=()
    local commands=("kubectl")
    local must_have_one_flag=()
    local must_have_one_noun=()
    local last_command
    local nouns=()

    __kubectl_handle_word
}

if [[ $(type -t compopt) = "builtin" ]]; then
    complete -o default -F __start_kubectl kubectl
else
    complete -o default -o nospace -F __start_kubectl kubectl
fi

# ex: ts=4 sw=4 et filetype=sh

BASH_COMPLETION_EOF
}

__kubectl_bash_source <(__kubectl_convert_bash_to_zsh)
_complete kubectl 2>/dev/null
