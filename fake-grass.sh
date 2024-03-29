#!/bin/bash


if [ $# -lt 1 ]; then
    echo "Usage: ./app.py [N]"
    exit 1
fi

N=$1


if [ -n $N ] && [ $N -eq $N ] 2>/dev/null; then

else
    echo "N must be a number."
    exit 1
fi

shift

for day in {$N..1..1}
do
    N_DAYS_BEFORE=$(date -v -"$day"d +%Y-%m-%dT%H:%M:%S)
    echo $N_DAYS_BEFORE # For test
    
    if [ `expr $day % 2` -eq 1 ]; then
        echo :trollface: > fake-commit.txt
        git add fake-commit.txt
    else
        echo sej > fake-commit.txt
        git add fake-commit.txt
    fi

    # Must be in a single line.
    GIT_AUTHOR_DATE=$N_DAYS_BEFORE GIT_COMMITTER_DATE=$N_DAYS_BEFORE git commit $@

done

git push
