#!/usr/bin/env sh

cd /var/dev.pitlor/.files || exit
git pull
git add -A
git commit -am "Changes from $(hostname) on $(date -I)"
git push origin master

