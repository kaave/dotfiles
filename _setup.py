#!/usr/bin/env python3

from sys import exit
from os import symlink, path, environ, remove, makedirs
import subprocess
import platform
import errno

#
# defines
#
system_name = platform.system()
is_macos = system_name == 'Darwin'
is_linux = system_name == 'Linux'
is_windows = system_name == 'Windows'
home_dir = environ['HOME']
tpm_path = f'{home_dir}/.tmux/plugins/tpm'
zplug_path = f'{home_dir}/.zplug'
fisher_path = f'{home_dir}/.config/fish/functions/fisher.fish'
anyenv_path = f'{home_dir}/.anyenv'

links = [
    # shell
    '.bash',
    '.bashrc',
    '.bash_profile',
    '.inputrc',

    # linter
    '.textlintrc',

    # tmux
    '.tmux.conf',

    # git
    '.gitconfig',

    # gem
    '.gemrc',

    # vim (and clones)
    '.vim',
    '.vimrc',
    '.gvimrc',
    '.ideavimrc',

    # emacs
    '.emacs.d',

    # language support tools
    '.ctags',
    '.tern-project',
]

config_links = [
    'alacritty',
    'nvim',
    'powerline',
    'fish',
    'rofi',
]


def setup_macos():
    global links
    links.append('.xvimrc')

    config_links.append('karabiner')

def setup_linux():
    global links
    links.append('.xinitrc')
    links.append('.Xresources')
    links.append('.xsession')

    config_links.append('awesome')
    config_links.append('fontconfig')


def setup():
    if is_macos:
        setup_macos()
        print('macOS.')
    elif is_linux:
        setup_linux()
        print('Linux.')


def create_symlink(target, link_name):
    try:
        symlink(target, link_name)
        print('  create link:', target, link_name)
    except OSError as error:
        if error.errno == errno.EEXIST:
            remove(link_name)
            symlink(target, link_name)
            print('  create link:', target, link_name)
        else:
            raise error


def git_clone(target, output):
    subprocess.run(['git', 'clone', target, output])
    print('  clone:', target, output)


if __name__ == '__main__':
    if is_windows:
        print('sorry, this script is NOT running on Windows.')
        exit

    setup()

    # create symbolic links
    config_dir = f'{home_dir}/.config'
    if not path.exists(config_dir):
        makedirs(config_dir)

    for source in links:
        create_symlink(f'{home_dir}/dotfiles/{source}', f'{home_dir}/{source}')

    for source in config_links:
        create_symlink(f'{home_dir}/dotfiles/.config/{source}', f'{config_dir}/{source}')

    #
    # tmux
    #
    if not path.exists(tpm_path):
        git_clone('https://github.com/tmux-plugins/tpm', tpm_path)

    # #
    # # zsh
    # #
    # if not path.exists(zplug_path):
    #     git_clone('https://github.com/zplug/zplug', zplug_path)

    # #
    # # fish
    # #
    # if not path.exists(fisher_path):
    #     subprocess.run(
    #         ['curl', '-Lo', fisher_path, '--create-dirs', 'git.io/fisher'])
    #     print('  download:', fisher_path)

    #     subprocess.run(['fish', '-lc', 'fisher'])

    print('')
