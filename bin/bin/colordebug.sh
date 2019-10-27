#!/bin/bash


echo "regular "

for x in {0..7}; do
  for i in {30..37}; do
      echo -ne "\e[$x;$i""m\\\e[$x;$i  ""m\e[0m "
  done
  echo
done

echo -ne '\e[0m'
echo

for x in {0..7}; do
  for i in {30..37}; do
    for a in {40..47}; do
      echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
    done
    echo
  done
done

echo -ne '\e[0m'
echo "done"
