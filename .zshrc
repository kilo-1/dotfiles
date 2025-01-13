# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -r /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
fi

export PATH=$PATH:/Users/aryankumar/.spicetify
export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/aryankumar/.spicetify

# Created by `pipx` on 2024-07-15 22:26:27
export PATH="$PATH:/Users/aryankumar/.local/bin"

eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) -----
alias ls="eza -a --icons=always --oneline --color=always --no-filesize --no-time"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ---- yazi file manager ----
export EDITOR=nvim

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# random git stuff
git config user.name "kilo's mac"
git config user.email "trc.kilo0@gmail.com"

export PATH="$HOME/scripts:$PATH"

alias syncconfig="~/scripts/sync_config.sh"

# Start tmux only in an interactive shell and if not already in a tmux session
if [[ $- == *i* ]] && [[ -z $TMUX ]]; then
  tmux
fi
