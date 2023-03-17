#!/bin/bash

read -p "Site ? (htb|rootme|thm|custom) : "  site

case $site in
	htb)
        read -p "Type ? (box|chall|fort|pro) : " type
        read -p "Name ? : " name
		if [ $type == "box" ]; then
			/usr/bin/mkdir -p /home/hls/htb/boxes/$name/nmap /home/hls/htb/boxes/$name/www /home/hls/htb/boxes/$name/infos /home/hls/htb/boxes/$name/fuzzing /home/hls/htb/boxes/$name/tmp /home/hls/htb/boxes/$name/exploits
			cd /home/hls/htb/boxes/$name && /usr/bin/tmux
		elif  [ $type == "chall" ]; then
            read -p "Categ ? (pwn|hardware|crypto|mobile|reverse|gamepwn|forensics|misc|web) : " categ
			/usr/bin/mkdir -p /home/hls/htb/challenges/$categ/$name
			cd /home/hls/htb/challenges/$categ/$name && /usr/bin/tmux
        elif [ $type == "fort" ]; then
			/usr/bin/mkdir -p /home/hls/htb/fort/$name/nmap /home/hls/htb/fort/$name/www /home/hls/htb/fort/$name/infos /home/hls/htb/fort/$name/fuzzing /home/hls/htb/fort/$name/tmp /home/hls/htb/fort/$name/exploits
			cd /home/hls/htb/fort/$name && /usr/bin/tmux
        elif [ $type == "pro" ]; then
            /usr/bin/mkdir -p /home/hls/htb/pro/$name/
			cd /home/hls/htb/pro/$name && /usr/bin/tmux
		fi
		;;
	rootme)
        read -p "Type ? (ctf|chall) : " type
        read -p "Name ? : " name
		if [ $type == "ctf" ]; then
			/usr/bin/mkdir -p /home/hls/rootme/ctf/$name/nmap /home/hls/rootme/ctf/$name/www /home/hls/rootme/ctf/$name/infos /home/hls/rootme/ctf/$name/fuzzing /home/hls/rootme/ctf/$name/tmp /home/hls/rootme/ctf/$name/exploits
			cd /home/hls/rootme/ctf/$name && /usr/bin/tmux
		elif  [ $type == "chall" ]; then
            read -p "Categ ? (app_script|app_systeme|cracking|crypto|forensics|dev|realiste|reseau|steg|web_client|web_serveur) : " categ
			/usr/bin/mkdir -p /home/hls/rootme/challs/$categ/$name
			cd /home/hls/rootme/challs/$categ/$chall_name && /usr/bin/tmux
		fi
		;;
	thm)
        read -p "Room ? : " name
		/usr/bin/mkdir -p /home/hls/thm/$name/
		cd /home/hls/thm/$name && /usr/bin/tmux
		;;
    custom)
        read -p "Name ? : " name
		/usr/bin/mkdir -p /home/hls/ctf/$name/
		cd /home/hls/ctf/$name && /usr/bin/tmux
        ;;    
esac