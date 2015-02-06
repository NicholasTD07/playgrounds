#!/bin/bash

local_branches() {
    git for-each-ref refs/heads --format='%(refname:short)'
}
}

