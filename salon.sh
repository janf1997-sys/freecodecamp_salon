#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon  --tuples-only -c"

MAIN_MENU() {
SERVICES=$($PSQL "SELECT service_id, name FROM services")
echo "$SERVICES" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done
echo -e "\nWhat service do you want?"
read SERVICE_ID_SELECTED

SERVICE_AVAILABILITY=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

if [[ -z $SERVICE_AVAILABILITY ]]
then
  MAIN_MENU "This service is not available"
else
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
echo -e "\nWhat's your name?"
read CUSTOMER_NAME

INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi
echo -e "\nWhat time do you want your service?"
read SERVICE_TIME
CUSTOMER_ID_RESULT=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID_RESULT, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
}

MAIN_MENU