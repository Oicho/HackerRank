#!/usr/bin/env bash
read n
i=`echo "scale=4; ($n)"| bc -l`
printf "%.*f\n" 3 $i
