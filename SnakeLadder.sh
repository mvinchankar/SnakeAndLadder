#!/bin/bash -x
echo ---------------------Welcome To Snake and Ladder World--------------------

START=0;
PLAYER=1;
NO=0;
LADDER=1;
SNAKE=2;
position=0;
random=$((RANDOM%3))
random1=$((RANDOM%6+1))
function Plays()
{
 case $random in $NO)
      position=0;;
                $LADDER)
      positon=$(($postion+$random1));;
                $Snake)
      positon=$(($postion-$random1));;
 esac  
}
Plays
