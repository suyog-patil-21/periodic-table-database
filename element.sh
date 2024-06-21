#! /bin/bash

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  LENGTH_OF_INPUT=$(echo "$1" | wc -m)
  LENGTH_OF_INPUT=$(( LENGTH_OF_INPUT - 1))
  if [[ $1 =~ ^[0-9]+$ ]]
  then
  # For Input=Atomic number
  else if [[ $LENGTH_OF_INPUT -le 2 ]]
  # For Input=Element Symbol
  else
  # For Input=Element Name
  fi
  # Setting Variables
  
  echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
fi