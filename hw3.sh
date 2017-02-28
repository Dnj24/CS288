#!/bin/bash



i=0
#greps views from index.html
s=$(egrep -o "[0-9]+(,[0-9]+)+ views" index.html | tr -d "," | sed -e 's/\<views\>//g')
for i in $s
do
   echo $i
done > views.txt

#greps users
s=$(egrep -o 'by <a href="/channel/[a-zA-Z0-9]*|/user/[a-zA-Z0-9]*' index.html)
for i in $s
do
	echo $i
done > users.txt

#greps duration 
s=$(grep -o 'Duration: [0-9]*:[0-9]*' index.html | egrep -o [0-9]*:[0-9]+)
for i in $s
do 
	echo $i
done > duration.txt

#greps the id
s=$(grep -o 'id="[a-zA-Z0-9]*"' index.html | egrep -o [a-zA-Z0-9]+ | sed -e 's/\<id\>//g' | tr -s \\n)
for i in $s
do 
	echo $i
done > id.txt

#greps the title
s=$(egrep -o 'title=".*" aria-describedby' index.html | egrep -o 'title=".*"' | egrep -o '".*"')
for i in $s
do
	echo $i
done > titles.txt


paste users.txt titles.txt views.txt duration.txt id.txt | column -tc5 > newFile.txt
paste -d, newFile.txt > all.csv






