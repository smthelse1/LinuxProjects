sshpass -p "student" scp ./cat/s21_cat stephenj@192.168.0.22:/usr/local/bin
sshpass -p "student" scp ./grep/s21_grep stephenj@192.168.0.22:/usr/local/bin
sshpass -p "student" ssh stephenj@192.168.0.22 ls /usr/local/bin >> log.txt