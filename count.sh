#Build a table of counters for the commands under /bin in alphabetical order. Use loop and array to design and implement the script.  

#!/bin/bash

letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
cnt=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

#ls /bin > /tmp/x 

cmds=$(ls /bin)  #set all the commands under bin to cmds.
lst=($cmds)      #set cmds into a list.

for dir in "${lst[@]}"; #for the directory in all of the elems in list
do
	x=$(echo $dir)  #set x as a reference to directory 

	for ((i=0; i<${#letters[@]}; i++)); #for the number of letters  
	do 
		firstChar=$(echo ${x:0:1})  #find out the first character of each letter
		  if [ "$firstChar" == "${letters[i]}" ]; then #if the first character of each letter is 
	    		cnt[i]=$((${cnt[i]} + 1))              #one of the letters, then increment the counter.
		  fi
	done 
done

for ((j=0; j<${#letters[@]}; j++));  #for the number of letters 
do
	echo ${letters[j]} ${cnt[j]} #display the letter and the associated counter. 
done
  
