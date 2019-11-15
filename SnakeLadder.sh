
#!/bin/bash -x
echo "SNAKE and ladder game"

positionOfPlayerOne=0
positionOfPlayerTwo=0
NUMBEROFPLAYERS=2
number=0
LADDER=1
SNAKE=2
diceCount=0
NOPLAY=0

function toDie()
{
 random=$(( RANDOM%6+1 ))
 totalDiePlayed=$(( $totalDiePlayed+1 ))
}
function whoWins()
{
 while ! [[ $positionOfPlayerOne -eq 100 || $positionOfPlayerTwo -eq 100 ]]
 do
   toDie
   play
 done
}

function getPositionForPlayer2()
{
 random1=$((RANDOM%3))
 case $random1 in  $NOPLAY )
      positionOfPlayerTwo=$(($positionOfPlayerTwo+0 ));;
                   $LADDER )
      echo "Played again for ladder"
      positionOfPlayerTwo=$(($positionOfPlayerTwo + $random))
      toDie
      getPositionForPlayer2 ;;
                   $SNAKE )
      positionOfPlayerTwo=$(($positionOfPlayerTwo - $random));;
 esac 

}

function getPositionForPlayer1()
{
 random1=$((RANDOM%3))
 case $random1 in  $NOPLAY )
      positionOfPlayerOne=$(($positionOfPlayerOne+0 ));;
                   $LADDER )
      echo "Played again for ladder"
      positionOfPlayerOne=$(($positionOfPlayerOne + $random))
      toDie          
      getPositionForPlayer1 ;;
                   $SNAKE )
      positionOfPlayerOne=$(($positionOfPlayerOne - $random));;
 esac 

}


function play() {
  
   for(( i=1; i<=$NUMBEROFPLAYERS; i++))
   do
     echo $i
     if [ $i -eq 1 ]
     then
        getPositionForPlayer1  
        if [ $positionOfPlayerOne -gt 100 ]
        then 
            positionOfPlayerOne=$(($positionOfPlayerOne-$random))
        fi
    
        if [ $positionOfPlayerOne -eq 100 ]
        then 
            echo "player1 win"
            break
        fi    
    
        if [ $positionOfPlayerOne -lt 0 ]
        then 
            positionOfPlayerOne=0
        fi
        echo "Position1:" $positionOfPlayerOne
     fi
     if [ $i -eq 2 ]
     then
         toDie
         getPositionForPlayer2
         if [ $positionOfPlayerTwo -gt 100 ]
         then 
             positionOfPlayerTwo=$(($positionOfPlayerTwo-$random))
         fi
    
         if [ $positionOfPlayerTwo -eq 100 ]
         then 
             echo  "player2 win"
         break
         fi    
    
         if [ $positionOfPlayerTwo -lt 0 ]
         then 
             positionOfPlayerTwo=0
         fi
         echo "Player2:" $positionOfPlayerTwo

     fi
  done
}
whoWins
echo dice count :$totalDiePlayed

