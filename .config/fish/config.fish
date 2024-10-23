set fish_greeting
set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# default editor
set -gx EDITOR nvim

# set aliases
command -qv nvim && alias vim nvim
zoxide init fish | source
alias lg lazygit
alias ll "eza -l"
alias cat bat

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias exegol 'sudo -E (which exegol)'
