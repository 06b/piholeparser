#!/bin/bash


printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Cleaning Up."

if 
ls /etc/piholeparser/lists/*.txt &> /dev/null; 
then
sudo rm /etc/piholeparser/lists/*.txt
else
echo ""
fi

if 
ls /etc/piholeparser/compressedconvert/*.7z &> /dev/null; 
then
sudo rm /etc/piholeparser/compressedconvert/*.7z
else
echo ""
fi

if 
ls /etc/piholeparser/compressedconvert/*.tar.gz &> /dev/null; 
then
sudo rm /etc/piholeparser/compressedconvert/*.tar.gz
else
echo ""
fi

if 
ls /etc/piholeparser/compressedconvert/*.txt &> /dev/null; 
then
sudo rm /etc/piholeparser/compressedconvert/*.txt
else
echo ""
fi

if 
ls /var/www/html/compressedconvert/*.txt &> /dev/null; 
then
sudo rm /var/www/html/compressedconvert/*.txt
else
echo ""
fi

printf "$magenta" "___________________________________________________________"
echo ""
