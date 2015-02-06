#!/bin/bash

local_branches() {
    git for-each-ref refs/heads --format='%(refname:short)'
}

current_branch() {
    # only works on local branches
    git rev-parse --abbrev-ref HEAD
}

}

