function yazi_cd
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function yazi_cd_repaint
	yazi_cd
	commandline -f repaint
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
    direnv hook fish | source

    alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    alias zed="zed --new"
    alias vim=nvim
    alias top=btm
    alias ly=yazi_cd
    abbr -a cpnixos cp /run/media/brian/nixos/home/brian/
    bind \co yazi_cd_repaint
end

fish_add_path ~/.local/share/bin
fish_add_path ~/.cabal/bin
fish_add_path ~/.ghcup/bin
set -Ua fish_user_paths "$HOME/.rye/shims"

source "$HOME/.cargo/env.fish"

# opam configuration
source /home/brian/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -x VISUAL nvim
set -x EDITOR nvim
