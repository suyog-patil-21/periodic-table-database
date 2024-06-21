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
    ELEMENT_INFO_RESULT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
  elif [[ $LENGTH_OF_INPUT -gt 0 && $LENGTH_OF_INPUT -le 2 ]];
  then
  # For Input=Element Symbol
    ELEMENT_INFO_RESULT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol LIKE '$1'")
  else
  # For Input=Element Name
    ELEMENT_INFO_RESULT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name LIKE '$1'")
  fi

  if [[ -z $ELEMENT_INFO_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    # Setting Variables
    ATOMIC_NUMBER=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f1)
    ELEMENT_NAME=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f2)
    ELEMENT_SYMBOL=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f3)
    ELEMENT_TYPE=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f4)
    ELEMENT_MASS=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f5)
    ELEMENT_MELTING_POINT=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f6)
    ELEMENT_BOILING_POINT=$(echo "$ELEMENT_INFO_RESULT" | cut -d '|' -f7)
    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
  fi
fi