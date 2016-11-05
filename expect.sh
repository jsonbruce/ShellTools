#!/usr/bin/expect  
spawn su root  
set password "111111"
expect "Password: "  
send "$password\r"  
interact
