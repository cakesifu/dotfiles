#!/bin/bash


echo "regular "

for x in {0..3}; do
    for i in {30..37}; do
            echo -ne "\e[$x;$i""m\\\e[$x;$i""m\e[0;37 "
        echo
    done
done
echo ""
