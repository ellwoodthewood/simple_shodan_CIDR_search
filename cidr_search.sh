#!/bin/bash
shodan init insert_api_key_here         ###Shodan API key, sometimes on sale on 'cyberMonday'
while read p; do                        ###read the lines from the file at last line
  p2=${p::-3}                           ###remove the last 3 characters, in this case "/xx" of CIDR notation
  shodan download $p2 net:$p            ###download info using network as filename
  shodan convert $p2.json.gz xlsx       ###convert from json to Excel (personal preference)
done <cidr_list.txt                     ###feed it the text file of cidr addresses, one per line
