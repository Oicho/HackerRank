#!/usr/bin/env bash

read num
sum_int=0
for ((count=0;count<num;count++))
do
    read i
    let "sum_int += i"
done
sum_int=`echo "scale=4; $sum_int / $num" | bc -l`
printf "%.*f\n" 3 $sum_int
