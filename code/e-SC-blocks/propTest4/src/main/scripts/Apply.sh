#!/bin/bash

if [ "$PROP__u" != "" ] && [ "$PROP__p" != "" ] && [ "$PROP__H" != "" ] && [ "$PROP__P" != "" ];
then
  echo "Authorisation completed."
else
  echo "Sorry, connection invalid. Please enter all the valid log-in details"
fi

if [ "$PROP__ncores" == "" ];
then
	echo "Ncores set to default value"
else
	echo "The maximum value for ncores is 1"
	echo "The current ncores in the input is $PROP__ncores"
fi

if [ "$PROP__measure_type" == "auto" ];
then
 	echo "Measure type is set to auto"
else
	echo "Measure type is set to manual by default"
fi

if [ "$PROP__check_type" == "no" ];
then	
	echo "Check type is set to no";
else
	echo "Check type is set to yes by default"
fi

if [ "$PROP__dim_query" == "" ];
then
	echo "No dimension query has been selected in command"
else
	echo "You have selected: Dimension query $PROP__dim_query"
fi

if [ "$PROP__measure" == "" ];
then
	echo "No measure has been selected in command"
else
	echo "You have selected measure: $PROP__measure"
fi

if [ "$PROP__query" == "" ];
then
	echo "Please select an query operation"
else
	echo "Querying $PROP__query"
fi

if [ "$PROP__cube" == "" ];
then
	echo "Please select a cube operation"
else
	echo "You have inputted $PROP__cube"
fi

case "$PROP__compressed" in
        yes)
        echo "Compressed is $PROP__compressed";;
         
        no)
        echo "Compressed is $PROP__compressed";;
         
        auto)
        echo "Compressed is $PROP__compressed";;
        *)
            echo "Compressed is not a valid type: Compressed parameter: $PROP__compressed"
esac

case "$PROP__objkey_filter" in
        all)
        echo "objkey_filter is $PROP__objkey_filter";;
        
        none)
        echo "objkey_filter is $PROP__objkey_filter";;
         
        apply)
        echo "objkey_filter is $PROP__objkey_filter";;
        *)
            echo "objkey_filter is not a valid type: objkey_filter parameter: $PROP__objkey_filter"
esac
