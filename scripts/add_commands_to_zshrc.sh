#!/bin/bash
# This script adds commands to .zshrc source file

workspace_dir=$1

commands="\n\
# Automatically activate Python virtual environment\n\
source /.venv/bin/activate\n\n\
\
# Functions\n\n\
# Vim into .zshrc file\n\
vb() {\n\
    vim ~/.zshrc\n\
}\n\n\
\
# Source .zshrc file\n\
sb() {\n\
    source ~/.zshrc\n\
}\n\n\
\
# Aliases\n\
alias py='python'\n\
alias gs='git status'\n\
alias gf='git fetch'\n\
alias gfp='git fetch --prune'\n\
alias ggs='git stash'\n\
alias ggsls='git stash list'\n\
"

echo -e $commands >> ~/.zshrc

# Add exception to dubious ownership
git config --global --add safe.directory $workspace_dir