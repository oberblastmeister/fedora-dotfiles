from typing import *
from subprocess import run
import subprocess

packages = [
    'fish',
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
    'evince',
    'zathura',
    'zathura-plugins-all',
    'gthumb',
    'gnome-software',
    'gh',
    'direnv',
    'just',
    'python3-black',
    'ormolu',
    'strace',
    'bat',
    'llvm',
    'clang-tools-extra',
    'clang',
    'tokei',
    'duf',
    # niri stuff
    'niri',
    'swaylock',
    'swayidle',
    'mako',
    'wlsunset',
    'swww'
    'brightnessctl',
    'wpctl',
    'tofi',
    'wob',
]

copr_packages = [
    ('atim/bottom', 'bottom'),
    ('isaksamsten/niriswitcher', 'niriswitcher'),
]

def install_copr():
    for copr, _ in copr_packages:
        run(["sudo", "dnf", "copr", "enable", copr])
    run(["sudo", "dnf", "install"] + [package for _, package in copr_packages])

def install():
    run(["sudo", "dnf", "install"] + packages)

def main():
    install()

if __name__ == '__main__':
    main()
