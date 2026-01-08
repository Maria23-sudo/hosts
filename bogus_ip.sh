#!/bin/bash




validate_ip(){
host=$1
ip=$2
dns=$3



  if [[ -z "$ip" || "$ip" == \#* || $host == *"localhost"* ]]; then
        continue
    fi
    if [[ -z "$host" ]]; then
    continue
    fi
    
    real_ip=$(nslookup "$host" "$dns" 2>/dev/null | awk '/Address: / {print $2; exit}')
    if [ "$real_ip" != "$ip" ]; then
        echo "Host has a real ip!"
    fi

}

validate_ip $1 $2 $3 
