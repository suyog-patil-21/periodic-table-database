#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  LENGTH_OF_INPUT=$( echo "$1" | wc -m )
  LENGTH_OF_INPUT=$(( LENGTH_OF_INPUT - 1 ))
  if [[ $1 =~ ^[0-9]+$ ]];
  then
  # For Input=Atomic number
    echo "number"
  elif [[ $LENGTH_OF_INPUT -gt 0 && $LENGTH_OF_INPUT -le 2 ]];
  then
  # For Input=Element Symbol
    echo "a symbol"
  else
  # For Input=Element Name
    echo "element"
  fi
  # Setting Variables
  ATOMIC_NUMBER=
  ELEMENT_NAME=
  ELEMENT_SYMBOL=
  ELEMENT_TYPE=
  ELEMENT_MASS=
  ELEMENT_MELTING_POINT=
  ELEMENT_BOILING_POINT=
  echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
fi