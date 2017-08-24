#!/bin/bash
## This Sets up the writing of additional lists

## Variables
SCRIPTBASEFILENAME=$(echo `basename $0 | cut -f 1 -d '.'`)
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../scriptvars/
STATICVARS="$SCRIPTVARSDIR"staticvariables.var
if
[[ -f $STATICVARS ]]
then
source $STATICVARS
else
echo "Static Vars File Missing, Exiting."
exit
fi

RECENTRUN="$SPECIFICLOGSDIR""$SCRIPTBASEFILENAME".log

## Start File Loop
## For .sh files In The listgen Directory
for f in $ALLLISTGENSCRIPTS
do

## Loop Vars
BASEFILENAME=$(echo `basename $f | cut -f 1 -d '.'`)
BASEFILENAMENUM=$(echo $BASEFILENAME | sed 's/[0-9]//g')
BASEFILENAMEDASHNUM=$(echo $BASEFILENAME | sed 's/[0-9\-]/ /g')
BNAMEPRETTYSCRIPTTEXT=$(echo $BASEFILENAMEDASHNUM)
TAGTHEREPOLOG="[Details If Any]("$LISTGENSCRIPTSLOGDIRRAW""$BASEFILENAME".log)"
BREPOLOG="$LISTGENSCRIPTSLOGDIR""$BASEFILENAME".log
timestamp=$(echo `date`)

printf "$lightblue"    "$DIVIDERBARB"
echo ""
printf "$cyan"   "$BNAMEPRETTYSCRIPTTEXT $timestamp"
echo ""

## Log Subsection
echo "### $BNAMEPRETTYSCRIPTTEXT $timestamp" | tee --append $RECENTRUN &>/dev/null

## Create Log
if
[[ -f $BREPOLOG ]]
then
rm $BREPOLOG
fi
touch $BREPOLOG

## Clear Temp Before
if
[[ -f $DELETETEMPFILE ]]
then
bash $DELETETEMPFILE
else
echo "Error Deleting Temp Files."
exit
fi

## Run Script
bash $f

## Clear Temp After
if
[[ -f $DELETETEMPFILE ]]
then
bash $DELETETEMPFILE
else
echo "Error Deleting Temp Files."
exit
fi

echo "$TAGTHEREPOLOG" | sudo tee --append $RECENTRUN &>/dev/null
echo "" | tee --append $RECENTRUN
printf "$orange" "$DIVIDERBARB"
echo ""

## End Of Loop
done
