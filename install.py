from typing import *
from subprocess import run
import subprocess

packages = [
    'ripgrep',
    'fd-find',
    'fzf',
    'zoxide',
    'opam',
    'rustup',
    'vim',
    'neovim',
    'curl',
    'git',
    'cascadia-code-fonts',
    'starship',
    'evince',
    'zathura',
    'zathura-plugins-all',
    'gthumb',
    'gnome-software',
]

copr_packages = [
    ('atim/bottom', 'bottom'),
    ('alxhr0/Obsidian', 'obsidian'),
]

def install_copr():
    for copr, _ in copr_packages:
        run(["sudo", "dnf", "copr", "enable", copr])
    run(["sudo", "dnf", "install"] + [package for _, package in copr_packages])

def install():
    run(["sudo", "dnf", "install"] + packages)

def main():
    install()
    install_copr()

if __name__ == '__main__':
    main()
