#Write a Linux Bash script, create.sh which creates a directory tree with depth d and breadth b in a programmable depth/breadth-first 
#fashion, where depth-first or breadth-first can be crontrolled by a command line parameter. Depth refers to the level of the directory tree
#while breadth refers to the number of directories a directory may have. Use d and b between 3 and 5 inclusive for testing purposes.


#!/bin/bash

d=$1            #depth is 1st positional param
b=$2            #breadth is 2nd positional param
seed_dir=$3     #where the directories will begin creating a tree


function main(){

open=($seed_dir)   #seed_dir is to be explored
close=()

	for((i=1; i<=d; i++)); do    #for the number of depths
		temp_open=()         #create a temp_open location 
		for x in ${open[@]}; do #for all the items in open 
   			temp=()               #create a temp location
    			for((k=1; k<=b; k++)); do  #for the number of breadths
     				mkdir $x/$i-$k   #make dir for breadth
     		 		temp=(${temp[@]} $x/$i-$k)  #store all the breadth dir in temp
    			done                                   #done
     			        temp_open=(${temp_open[@]} ${temp[@]})  #open all directories
       				close=(${close[@]} $x) #close 
    		done
  			open=(${temp_open[@]}) #traverse again 
	done
}

main $seed_dir  #call main
