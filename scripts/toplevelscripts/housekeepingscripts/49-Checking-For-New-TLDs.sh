#!/bin/bash
## This checks for new tld's

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

RECENTRUN="$HOUSEKEEPINGSCRIPTSLOGDIR""$SCRIPTBASEFILENAME".log

## Anything New?
if
[[ -f $VALIDDOMAINTLDBKUP && -f $VALIDDOMAINTLD ]]
then
gawk 'NR==FNR{a[$0];next} !($0 in a)' $VALIDDOMAINTLDBKUP $VALIDDOMAINTLD > $TLDCOMPARED
HOWMANYTLDNEW=$(echo -e "`wc -l $TLDCOMPARED | cut -d " " -f 1`")
fi

if
[[ "$HOWMANYTLDNEW" != 0 ]]
then
printf "$yellow"    "$HOWMANYTLDNEW New TLD's."
echo "* $HOWMANYTLDNEW New TLD's" | tee --append $RECENTRUN &>/dev/null
else
printf "$yellow"    "No New TLD's"
fi

## Backup TLD list if not there
if
[[ -f $VALIDDOMAINTLDBKUP ]]
then
rm $VALIDDOMAINTLDBKUP
fi
cp $VALIDDOMAINTLD $VALIDDOMAINTLDBKUP
