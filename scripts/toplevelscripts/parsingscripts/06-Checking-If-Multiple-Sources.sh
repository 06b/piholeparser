#!/bin/bash
## How many sources in the file

## Variables
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
if
[[ -f $TEMPPARSEVARS ]]
then
source $TEMPPARSEVARS
else
echo "Temp Parsing Vars File Missing, Exiting."
exit
fi

## Amount of sources greater than one?
HOWMANYLINES=$(echo -e "`wc -l $FILEBEINGPROCESSED | cut -d " " -f 1`")
if
[[ "$HOWMANYLINES" -le 1 ]]
then
printf "$yellow"    "$BASEFILENAME Has $HOWMANYLINES Sources."
AMOUNTOFSOURCES=$HOWMANYLINES
echo "AMOUNTOFSOURCES="$AMOUNTOFSOURCES"" | tee --append $TEMPPARSEVARS &>/dev/null
elif
[[ "$HOWMANYLINES" -gt 1 ]]
then
printf "$yellow"    "$BASEFILENAME Has $HOWMANYLINES Sources."
AMOUNTOFSOURCES=$HOWMANYLINES
echo "AMOUNTOFSOURCES="$AMOUNTOFSOURCES"" | tee --append $TEMPPARSEVARS &>/dev/null
fi
