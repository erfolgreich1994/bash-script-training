#!/bin/bash
## In The Name Of GOD ################################
######### Get and Sort script ########################
# Author: Mohammad Hassan Pashaii
# Contact: m_pashaii13@yahoo.com
# Date: 2022/10/21

######################################################

# This function is to check user input. If user does not give a number, this function display Error.
check () {
echo -en "Please enter a number: "
read input
if ! [[ "$input" =~ ^[+-]?[0-9]+$ ]] ; then
	echo "Sorry!"
	exit
fi



}


############################################################

# This function is to used to give user input and append them an array.

sorting () {

check 

for var in ${input[*]}
do
	array+=($(echo $var))
	printf "%s\n" ${array[*]} | sort -n  |sed s/+//g 
done

}
############################################################

# This is an infinitive loop

while :
do

sorting

done
