#!/bin/bash

set -e

local_branches() {
    git for-each-ref refs/heads --format='%(refname:short)'
}

current_branch() {
    # only works on local branches
    git rev-parse --abbrev-ref HEAD
}

contains_commit() {
    # example usage: contains_commit develop master
    #
    # to determine whether 'develop' contains 'master'
    # -> whether 'master' is an ancester of 'develop'

    local subject=$1
    local commit=$2

    git merge-base --is-ancestor $commit $subject
}

branches_does_not_contains_commit() {
    local commit=$1
    shift

    local branches=$*
    local branch_does_not_contains_commit=()

    for branch in $branches; do
        if contains_commit $branch $commit
        then
            echo $branch "contains" $commit
        else
            echo $branch
            branch_does_not_contains_commit+=("$branch")
        fi
    done
}

branches_does_not_contains_commit shell-git `local_branches`

