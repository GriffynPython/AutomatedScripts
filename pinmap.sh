#!/bin/bash
   #Use the ping command and use a variable named ip_address
   echo "Enter the ip address:"
   read ip_address
   COUNT=4
   echo "pinging $ip_address with $Count packets.."
   ping -c $COUNT $ip_address
   if [$? -eq 0]; then
     echo "Ping to $ip_address is successsfull"
     echo "Scanning $ip_address using nmap."
     sudo nmap -sC -sV $ip_address
  else
     echo "Ping to $ip_address is unsuccessfull"
  fi