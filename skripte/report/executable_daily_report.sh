#!/usr/bin/env bash


# git log --author="$email" --since '36 hours ago' --oneline | tee

timew summary :week

email=$(git config --get user.email)


function logs {
  (
    cd "${1}"

    if [ ! -d ".git" ] ; then
      return
    fi
    commits=$( git bidaily | wc -l)
    if [ ${commits} !=  0 ] ; then
      echo "---"
      echo "$(basename ${1})"
      git log --author="$email" --since '36 hours ago' --oneline || echo "Fehler in $(pwd)"
      echo ''
    fi
  )
}

export -f logs

fd -t d -H '\.git$'  ${HOME} --exec bash -c "logs {//}"
