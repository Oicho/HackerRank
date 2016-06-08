#!/usr/bin/env bash
# This is just a fun and unoptimised way to solve it =D
# this is why you should do it recursively
read input
result_str=""
l[0]=50
l_index=0
N=16
function generate_string {
	s=""
	l_index=0
	arr_len=${#l[@]}
	for ((X=0;X<100;X++));
	do
		if ((X == l[l_index]));
		then
			s="1$s"
			((l_index+=1))
			if (( l_index == arr_len )); then
				((l_index-=1))
			fi
		else
			s="_$s"
		fi
	done
	result_str="$s\n$result_str"
}

function duplicate {
	new_l[0]=0
	X=0
	for var in "${l[@]}"
	do
		new_l[$X]=`expr $var - 1`
		((X+=1))
		new_l[$X]=`expr $var + 1`
		((X+=1))
	done
	l=("${new_l[@]}") 
}

function ite {
	arr_len=${#l[@]}
	for ((X=0;X<${#l[@]};X++))
	do
		i=$((l[$X]))
		l[$X]=`expr $i - 1`
		((X+=1))
		i=$((l[$X]))
		l[$X]=`expr $i + 1`
	done
}
function launch {
	num=`echo "64 / (2 ^(1+$1))" | bc`
	for (( i = 0; i < num; i++ )); do
		generate_string
	done
	duplicate
	generate_string
	for (( Y = 0; Y < num-1; Y++ )); do
		ite
		generate_string
	done
}

function fill_tree {
	num=`echo "64 / (2 ^($1))" | bc`
	for (( i = 0; i < num; i++ )); do
		echo "____________________________________________________________________________________________________"
	done
}
for ((count=1;count<=input;count++))
do
	launch $count
done
while ((count<=5)); do
 	#statements
	fill_tree $count
 	((count+=1))
done

echo "____________________________________________________________________________________________________"
echo -e -n "$result_str"

