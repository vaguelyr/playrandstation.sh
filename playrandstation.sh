#!/bin/bash
# vague
# pick a random radcap.ru station and play it

prefix='http://radcap.ru/'

while true ; do
	url=$prefix$(shuf -n 1 <(wget -q -O - http://radcap.ru/index-d.html | grep \"[a-z]*.html -o | cut -d '"' -f 2 ))
	echo $url
	m3u=$(wget -q -O - $url | grep play/rc[0-9]/radio+caprice-[-+a-z]*.m3u -o)
	echo $prefix$m3u
	mpv $prefix$m3u
done

