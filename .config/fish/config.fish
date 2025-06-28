set fish_greeting
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
    alias t=trashy
    alias tp="trashy put"
    alias bazel="bazelisk"
    abbr -a opam_tools opam install ocaml-lsp-server ocamlformat utop ocaml-manual odig sherlodoc patdiff ocaml-index
    abbr -a cpnixos cp /run/media/brian/nixos/home/brian/
    abbr -a dunec dune build @check
    abbr -a duneb dune build
    abbr -a dunet dune test
    bind \co yazi_cd_repaint
end

fish_add_path ~/.local/share/bin
fish_add_path ~/.cabal/bin
fish_add_path ~/.ghcup/bin
fish_add_path ~/.mpl/bin
set -Ua fish_user_paths "$HOME/.rye/shims"

# cargo configuration
source "$HOME/.cargo/env.fish"

set -x VISUAL nvim
set -x EDITOR nvim

# dune preview bin
source "$HOME/.local/share/dune/env/env.fish"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/brian/.opam/opam-init/init.fish' && source '/home/brian/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/brian/.lmstudio/bin
