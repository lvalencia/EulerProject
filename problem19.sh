#!/bin/bash
c=0
x=1
y=1901
while [ $y -le 2000 ]
do
   while [ $x -le 12 ]
   do
      sun=`cal $x $y | sed 's/^ //g' | grep -c "^[1] "`
      if [ $sun -eq 1 ]
      then
         c=`echo 1 + $c | bc`
      fi
      x=`expr $x + 1`
   done
   y=`expr $y + 1`
   x=1
done
echo $c
