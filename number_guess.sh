#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Fetch user information from the database
USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")

# Check if the user exists
if [[ -z $USER_INFO ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  GAMES_PLAYED=0
  BEST_GAME="N/A"
else
  # Existing user
  IFS='|' read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate the secret number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"
while true
do
  read GUESS

  # Validate input
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESS_COUNT=$(( $GUESS_COUNT + 1 ))

  # Check the guess
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update the user's data
    GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
    if [[ $BEST_GAME == "N/A" || $GUESS_COUNT -lt $BEST_GAME ]]
    then
      BEST_GAME=$GUESS_COUNT
    fi
    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
    break
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done