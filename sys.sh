#!/bin/bash

clear
sleep 6 
echo "BIENVENUE SUR MON PROJET SYS"
echo " "
echo "CHOISIR UNE OPTION" 
echo " "                                                                     
echo "a - Informations sur les utilisateurs enregistrés il ya 3 jours"
echo "b - acquisition, installation et lancement de l'environement xampp"
echo "c - archivage des eléments du repertoire personnel modifié  par  le sudoer il ya 2 jours"
echo "d - informations d'utilisation du disque, de la memoire du processeur et du swap"
echo "quitter(Q/q)"
echo " " 
echo "Etudiant :  Yacoubou Ferdinand"            

       
read -r n

case $n in 
	

	'a') cut -d : -f 1 /etc/passwd>all_user
	

	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then 
		echo $user >3days_user.txt
		echo "a ete cree il ya 3 jours."
	      fi

	    done<user1 
	done<userx
	cat 3days_users.txt
	
 ;;
	'b') echo "telechargement de xampp"
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 echo " installation de xampp"
	 ./xampp-linux-x64-5.6.30-1-installer.run
	
	 sudo su
	echo "demarrage de xampp"
	/opt/lampp/lampp start


;;
	'c') echo "archivage"
	mkdir -p /home/seed/archive
	find /home/seed/ -type f -mtime 2 -print>/home/seed/ficmodi
	while read line
	do
	cp $line archive
	done </home/seed/ficmodi
	tar -czvf archive.tar.gz archive
	mv archive.tar.gz /media/seed/usb/*/archive.tar.gz
	;;
	'd') echo "Informations du disque :"
		df -h |grep /dev/sd
		echo "Informations de la memoire et du swap :"
		free -h 
;;
	* )  exit;;
	
esac