#!/bin/bash

function reverse {
	for (( i=${#arr[@]}-1 ;  i >= 0 ; i-- )) ; do #a for loop that will display all the elem  
		echo "${arr[i]}"                      #in the array in reverse order.
	    done
}
function main {
	cd $1              
	arr=( $(ls) )      #display contents of the directory and store in array.
	echo "****"
	reverse            #use reverse function to reverse the order of the contents.
}

main $1  #execute main function. 
