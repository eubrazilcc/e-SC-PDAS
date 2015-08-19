#!/bin/bash
function container()
{
if [ -n "$PROP__container" == "" ];
then
  echo "Please input the container name required. The data operator cannot be processed without a container name"
else
  echo "You have supplied a container name: $PROP__container"
fi
}

function count()
{
if [ "$PROP__u" != "" ] && [ "$PROP__p" != "" ] && [ "$PROP__H" != "" ] && [ "$PROP__P" != "" ];
then
  echo "Authorisation completed."
  echo "Welcome $PROP__u."
else
  echo "Sorry, connection invalid. Please enter all the valid log-in details"
fi
}

##To apply on all blocks. 
