#!/bin/bash

DURATION=7

if [ "$#" -eq 1 ]; then
  DURATION=$1
fi

sfdx force:org:create -a ProjectScratch -s -f config/project-scratch-def.json -d $DURATION
sfdx force:source:push -f -u ProjectScratch
sfdx force:user:permset:assign -n Projects
sfdx force:org:open -p /lightning/page/home
echo "This org is setup"
