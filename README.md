# Profiles

Here are my profiles for Bash, Git and other.

## Bash

```
bash/
├── .bash_aliases
├── .bash_profile
└── .bash_tweaks
```

## Git
```
git/
└── .gitconfig
```

## Installation

1. Clone this repo. Use a branch suitable for your OS:

```bash
git clone https://github.com/derTobsch/profiles.git -b debian
```

2. Launch the `install.sh` shell script. It will create all the necessary symlinks in your `home` directory.

```bash
sh ./install.sh
```

3. Add the following lines to your `~/.bashrc`:

```bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_tweaks ]; then
    . ~/.bash_tweaks
fi
```
