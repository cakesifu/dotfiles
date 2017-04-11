#!/bin/bash


echo "regular "

values=(0 1 7)

for x in ${values[@]}; do
    for i in {30..37}; do
            echo -ne "\e[$x;$i""m\\\e[$x;$i""m\e[0;37 "
            echo -ne '\e[0m'
        echo
    done
done

echo -ne '\e[0m'
echo "done"
