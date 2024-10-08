#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Check if the argument is an atomic number, symbol, or name
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    QUERY="SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
           FROM elements 
           INNER JOIN properties USING(atomic_number) 
           INNER JOIN types ON properties.type_id = types.type_id 
           WHERE elements.atomic_number = $1"
  else
    QUERY="SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
           FROM elements 
           INNER JOIN properties USING(atomic_number) 
           INNER JOIN types ON properties.type_id = types.type_id 
           WHERE elements.symbol = '$1' OR elements.name = '$1'"
  fi

  # Execute query and capture output
  ELEMENT_INFO=$($PSQL "$QUERY")

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_INFO" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi