.PHONY: stow
stow:
	# --no-folding prevents stow from creating directory symlinks
	stow . --no-folding

.PHONY: force_stow
force_stow: 
	stow . --no-folding --adopt

.PHONY: unstow
unstow:
	stow --no-folding --delete .
