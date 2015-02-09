#!/bin/bash

commits_count() {
    # usage: commits_count HEAD

    git rev-list --count $*
}

