#!/bin/bash
## Comments #'s and !'s .'s

## Variables
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../../../scriptvars/
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

if
[[ -f $BFILETEMP ]]
then
cat $BFILETEMP | sed '/\#\+/d; /\!\+/d; /^[.]/d' | grep -v '\^.' > $BTEMPFILE
fi

if
[[ -f $BFILETEMP ]]
then
rm $BFILETEMP
fi
