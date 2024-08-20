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

    alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"
    alias vim=nvim
    alias top=btm
    alias ly=yazi_cd
    abbr -a cpnixos cp /run/media/brian/nixos/home/brian/
    bind \co yazi_cd_repaint
end

source "$HOME/.cargo/env.fish"

# opam configuration
source /home/brian/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
