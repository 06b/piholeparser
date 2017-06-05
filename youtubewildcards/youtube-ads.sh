#!/bin/bash
sudo mkdir /var/www/html/lists
## Youtube adblocking
sudo rm /var/www/html/lists/youtube.txt
sudo rm /etc/piadvanced/piholetweaks/youtubeadblock/youtube-domains.txt
sudo rm /etc/piadvanced/piholetweaks/youtubeadblock/youtube-filtered.txt
sudo rm /etc/piadvanced/piholetweaks/youtubeadblock/youtube-ads.txt
sudo python /etc/piadvanced/piholetweaks/youtubeadblock/API_example.py > /etc/piadvanced/piholetweaks/youtubeadblock/youtube-domains.txt
sudo grep "^r" /etc/piadvanced/piholetweaks/youtubeadblock/youtube-domains.txt > /etc/piadvanced/piholetweaks/youtubeadblock/youtube-filtered.txt
sudo sed 's/\s.*$//' /etc/piadvanced/piholetweaks/youtubeadblock/youtube-filtered.txt > /etc/piadvanced/piholetweaks/youtubeadblock/youtube-ads.txt
sudo cp /etc/piadvanced/piholetweaks/youtubeadblock/youtube-ads.txt /var/www/html/lists/youtube.txt

#greps the log for youtube ads and appends to /var/www/html/lists/youtube.txt
sudo grep r*.googlevideo.com /var/log/pihole.log | awk '{print $6}'| grep -v '^googlevideo.com\|redirector' | sort -nr | uniq >> /var/www/html/lists/youtube.txt

#removes duplicate lines from /var/www/html/lists/youtube.txt
sudo perl -i -ne 'print if ! $x{$_}++' /var/www/html/lists/youtube.txt
