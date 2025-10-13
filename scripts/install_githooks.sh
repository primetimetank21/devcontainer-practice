#!/bin/bash
# This script installs Git Hooks to the .git/hooks directory.

# Hook Variables
pre_commit="$1/.git/hooks/pre-commit"
pre_push="$1/.git/hooks/pre-push"

# Pre-Commit
if [ ! -f $pre_commit ]
then
    echo "make all" > $pre_commit && chmod +x $pre_commit
fi

# Pre-Push
if [ ! -f $pre_push ]
then
    echo "make all" > $pre_push && chmod +x $pre_push
fi