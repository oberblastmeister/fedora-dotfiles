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
]

def install():
    run(["sudo", "dnf", "install"] + packages)

def main():
    install()

if __name__ == '__main__':
    main()
