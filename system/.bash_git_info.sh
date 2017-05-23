#!/usr/bin/env bash

trim () {
    awk '{$1=$1};1'
}

__git_info() {
    [ -x "$(which git)" ] || return    # git not found

    local git_eng="env LANG=C git"   # force git output in English to make our work easier
    # get current branch name or short SHA1 hash for detached head
    local branch="$($git_eng symbolic-ref --short HEAD 2>/dev/null || $git_eng describe --tags --always 2>/dev/null)"
    [ -n "$branch" ] || return  # git branch not found

    $git_eng status &>/dev/null || return

    local marks

    local stat="$($git_eng status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
    local all="$(git status --porcelain 2>/dev/null | wc -l | trim)"
    local unstaged="$(git status --porcelain 2>/dev/null | grep "^ M" | wc -l | trim)"
    local uncommited="$(git status --porcelain 2>/dev/null | grep "^M" | wc -l | trim)"
    local untracked="$(($all-$unstaged-$uncommited))"
    local commit="$(git rev-list HEAD --abbrev-commit --abbrev=0 -n1 2>/dev/null)"
    local ahead="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    local behind="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"

    [ "$untracked" -eq "0" ] || marks+=" $GIT_UNTRACKED_SYMBOL$untracked"
    [ "$unstaged" -eq "0" ] || marks+=" $GIT_UNSTAGED_SYMBOL$unstaged"
    [ "$uncommited" -eq "0" ] || marks+=" $GIT_UNCOMMITED_SYMBOL$uncommited"
    [ -n "$ahead" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$ahead"
    [ -n "$behind" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behind"

    # print the git branch segment without a trailing newline
    printf "$branch$marks"
}
