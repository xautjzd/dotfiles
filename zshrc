# 1. Completion system with cache for faster startup
autoload -Uz compinit
if [[ -z "$ZSH_COMPDUMP" ]]; then
  export ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
fi
compinit -d "$ZSH_COMPDUMP"
[[ -f ~/.zsh_completion ]] && source ~/.zsh_completion

# 2. PATH setup: Homebrew, Python
export PATH="/opt/homebrew/bin:$PATH"

# 3. Java environment (keep only the active version to avoid conflicts)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
export CLASSPATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"
export PATH="$JAVA_HOME/bin:$PATH"

# 4. Homebrew mirror acceleration
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"

# 5. Aliases for Git, Neovim, Python
alias gco='git checkout'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gm='git merge'
alias gcp='git cherry-pick'
alias glm='git log --author=zhengdong'
alias vim='nvim'
alias python='python3'

# 6. Python environment (prefer pyenv if available)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# 7. Show git branch in prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

# Prompt: green username@host, blue directory, yellow branch
PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %F{yellow}${vcs_info_msg_0_}%f %# '

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
