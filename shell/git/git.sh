#!/bin/bash

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

}

