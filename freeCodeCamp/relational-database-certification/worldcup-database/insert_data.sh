#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# CLEAR THE DATABASE BEFORE RUNNING THE SCRIPT
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Do not read the first line with the headings
  if [[ $YEAR != year ]]
  then
    # get winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    
    # get opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # if winner not found
    if [[ -z $WINNER_ID ]]
    then
      # insert winner team
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")

      if [[ $INSERT_WINNER_RESULT = "INSERT 0 1" ]]
      then
        echo -e "\nInserted team: $WINNER"
      fi

      #get new winner team id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi

    # if opponent not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert opponent team
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")

      if [[ $INSERT_OPPONENT_RESULT = "INSERT 0 1" ]]
      then
        echo -e "\nInserted team: $OPPONENT"
      fi

      # get new opponent team id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi

    # get game id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE WINNER_ID='$WINNER_ID' AND OPPONENT_ID='$OPPONENT_ID' AND round = '$ROUND' AND year = '$YEAR'")

    # if not found
    if [[ -z $GAME_ID ]]
    then
      # insert game
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      
      # echo inserted teams
      if [[ $INSERT_GAME_RESULT = "INSERT 0 1" ]]
      then
        echo -e "\nInserted game: $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS"
      fi
    fi
  fi
done
