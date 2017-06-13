#!/bin/bash
## This will download and extract tar lists

## Variables
source /etc/piholeparser/scriptvars/variables.var

## Start 7zip File Loop
for f in $TARLISTS
do

## Process sources within file.lst
for source in `cat $f`;
do

## Set Variables (again, I guess)
source /etc/piholeparser/scriptvars/variables.var

printf "$blue"    "___________________________________________________________"
echo ""

echo ""
printf "$cyan"    "$source"
echo "" 

if ping -c 1 $UPCHECK &> /dev/null
then
SOURCEIPFETCH=`ping -c 1 $UPCHECK | gawk -F'[()]' '/PING/{print $2}'`
SOURCEIP=`echo $SOURCEIPFETCH`
printf "$yellow"    "Fetching List from $UPCHECK located at the IP of $SOURCEIP and extracting."
sudo wget -q -O $TARTEMPFILE $source
TARFILEX=$(tar -xavf $TARTEMPFILE)
sudo mv $TARFILEX $FNAMEDONE
sudo rm $TARTEMPFILE
else 
printf "$red"    "$FNAME list unavailable right now"
fi 

echo ""
printf "$magenta" "___________________________________________________________"

## End Source loop
done

echo "$TARFILEX"
echo -e "\t`wc -l $FNAMEDONE | cut -d " " -f 1` lines downloaded"
ORIGFILESIZE=$(stat -c%s "$FNAMEDONE")
printf "$yellow"  "Size of $FNAMEDONE = $ORIGFILESIZE bytes."

## End File Loop
done
