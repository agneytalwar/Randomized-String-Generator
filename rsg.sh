#!/bin/bash
read str
count=$1
length=$2
echo count=$count, length=$length
strlen=${#str}
newstrlen=0
newstr=""
last=""
sum=0
if [ $length -lt 1 ]
  then echo Incorrect Input : Length should be greater than zero
       ((newstrlen = $length))
  fi 
while  [ $newstrlen -lt $length ]  
do
  if [ $count -le 1 ]
  then echo Incorrect Input : Count should be greater than one
       break
  fi 
  if [ $strlen -lt 1 ]
  then echo Incorrect Input : Alphabet set is empty
       break
  fi 
  if [ $strlen -eq 1 ] && [ $sum -eq $(( count - 1 )) ]
  then echo Add more characters to alphabet set to get string of required length
       break
  fi
  (( rand1= 1 + $(($RANDOM%$strlen))))
  (( rand2= 1 + $(($RANDOM%(($count-1))))))
  if [  "$last" == "${str: (( $rand1 - 1 )) :1}" ] && [ $((sum + rand2)) -ge $count  ]
  then
         continue
  else 
       if [ "$last" == "${str: (( $rand1 - 1 )) :1}" ]
       then ((sum+= $rand2))
       else
       last=${str: (( $rand1 - 1 )) :1}
       sum=$rand2
       fi
  fi
  alpha=${str: (( $rand1 - 1 )) :1}
  if [  $((newstrlen + rand2)) -gt $length ]
    then 
        ((rand2=length-newstrlen))
    fi
     newadd=""
     for (( c=1; c<=$rand2; c++ ))
     do
       newadd+=$alpha
     done
     newstr+=$newadd
     ((newstrlen+=$rand2))
     echo $newstr
done

       
