#!/bin/bash -x
echo ---------------------Welcome To Snake and Ladder World--------------------

START=0;
PLAYER=1;
NO=0;
LADDER=2;
SNAKE=1;
position=0;
diceCount=0;
function Plays()
{ 
  while [ $position -le 100  ]
  do
   random=$((RANDOM%3))
   random1=$((RANDOM%6+1))
   diceCount=$((diceCount+1)) 
   case $random in  $SNAKE )
        position=$(($position-$random1));;
                   $LADDER )
        position=$(($position+$random1));;
   esac
   
   if [ $position -le 0 ]
   then
       position=0;
   fi
   echo Postion : $position
   if [ $position -gt 100 ]
   then 
       position=$(($position-$random1))
   fi
   if [ $position -eq 100 ]
   then 
       echo You Win
       break;  
   fi
  done
} 
Plays
echo Dice Count : $diceCount
