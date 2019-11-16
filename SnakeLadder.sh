#!/bin/bash -x

echo "Welcome To Snake And Ladder World"

NO_PLAY=1
LADDER=2
SNAKE=3
END=100
START=0
FIRST_PLAYER=1
SECOND_PLAYER=2
switchPlayers=0
ladderPosition=0

positionOfPlayer=$START
checkPosition=$START
positionOfPlayerOne=$START
positionOfPlayerTwo=$START

function rollDice() {

dieRandomNumber=$(( ( RANDOM % 6 ) + 1 ))
checkPosition=$(( ( RANDOM % 3 ) + 1 ))

case $checkPosition in
   $NO_PLAY)
         positionOfPlayer=$positionOfPlayer    
         ;;
   $LADDER)
         positionOfPlayer=$(( $positionOfPlayer + $dieRandomNumber ))
         ladderPosition=1
         ;;
    $SNAKE)
         
         positionOfPlayer=$( positionOfPlayers $positionOfPlayer $dieRandomNumber )
         ;;
esac
}
function checkIfLadderComes() {
     checkWhetherItIsGreaterThanEnd $positionOfPlayer
     while [ $ladderPosition == 1 ]
     do
        ladderPosition=0
        rollDice
        checkWhetherItIsGreaterThanEnd $positionOfPlayer
     done
     
}
function positionOfPlayers() {
         
     if [ $1 -gt $START ]
     then
         positionOfPlayer=$(( $positionOfPlayer-$2 ))
     else
         positionOfPlayer=0
     fi

     echo $positionOfPlayer 
}

function checkWhetherItIsGreaterThanEnd() {
     
     if [ $1 -gt $END ]
     then
             positionOfPlayer=$(( $positionOfPlayer - $dieRandomNumber ))  
     fi
}

function play() {
if [ $(( $switchPlayers % 2 )) -eq 0  ]
then

     positionOfPlayer=$positionOfPlayerOne
     rollDice
     checkIfLadderComes
     positionOfPlayerOne=$positionOfPlayer
     
else

     positionOfPlayer=$positionOfPlayerTwo
     rollDice
     checkIfLadderComes
     positionOfPlayerTwo=$positionOfPlayer   
fi
}


function whoWins() {
    
while [ $positionOfPlayer -lt $END ]
do
     play
 
     if [ $positionOfPlayerOne -eq $END ]
     then
        echo "Player One win"
     elif [  $positionOfPlayerTwo -eq $END ]
     then
        echo "Player Two win"   
     fi   
        
        switchPlayers=$(( $switchPlayers + 1 )) 
done
}

whoWins

