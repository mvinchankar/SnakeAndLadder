#!/bin/bash -x
echo ---------------------Welcome To Snake and Ladder World--------------------

START=0;
NO=0;
LADDER=2;
SNAKE=1;
position=0;
diceCount=0;
playerOneCount=0;
playerTwoCount=0;
count1=0;
count2=0;
playerOnePosition=0;
playerTwoPosition=0;
function plays()
{ 
  
  while [ $position -le 100  ]
  do
   random=$((RANDOM%3))
   random1=$((RANDOM%6+1))
   diceCount=$(($diceCount+1))
   case $random in  $SNAKE )
        position=$(($position-$random1));;
                   $LADDER )
        position=$(($position+$random1));;
   esac
   
   if [ $position -le 0 ]
   then
       position=0;
   fi
   if [ $position -gt 100 ]
   then 
       position=$(($position-$random1))
   fi
   if [ $playerOnePosition -eq 100 ]
   then  
       win=1 
       echo PlayerOne Win
       break;  
   fi
   if [ $playerTwoPosition -eq 100 ]
   then 
       win=1
       echo Player Two Win
       break;
   fi
   if [ $playerOneCount == 1 ]
   then
      playerOneCount=0;
   elif [ $playerOneCount == 0 ]
   then 
      playerOnePosition=$(($position))
      playerOneCount=1;
      echo PlayerOnePosition : $position
   fi
   if [ $playerOneCount == 1 ]
   then 
      playerOneCount=2;
      if [ playerOneCount == 2 ]
      then
          playerTwoCount=0; 
          if [ $playerTwoCount == 0 ]
          then
             playerTwoCount=$(($playerTwoCount+1))
             playerTwoPosition=$(($position))
             echo PlayerTwoPosition : $position
          fi
      fi
   fi
  done
}
plays
