#!/bin/bash
## Remove TempWhites

## Variables
SCRIPTBASEFILENAME=$(echo `basename $0 | cut -f 1 -d '.'`)
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../../scriptvars/
STATICVARS="$SCRIPTVARSDIR"staticvariables.var
if
[[ -f $STATICVARS ]]
then
source $STATICVARS
else
echo "Static Vars File Missing, Exiting."
exit
fi

RECENTRUN="$ENDTASKSCRIPTSLOGDIR""$SCRIPTBASEFILENAME".log

CHECKME=$WHITELISTTEMP
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
fi
