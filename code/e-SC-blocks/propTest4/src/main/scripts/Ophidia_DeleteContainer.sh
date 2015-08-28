#!/bin/bash
#
# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia DeleteContainer
# Author: William Ng
# ------------------------------------------------------------
# The following environment variables are required to connect
# ------------------------------------------------------------

echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties
echo "container=$PROP__container" >> $OUTPUT__output_properties


## All mandatory values
if [ "$PROP__cube" == "" ] && [ "$PROP__hidden" == "" ] && [ "$PROP__delete_type" == "" ] ;
then
	echo "The parameter cube is empty"
else
$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_deletecontainer container=$PROP__container;hidden=$PROP__hidden;delete_type=$PROP__delete_type;"

fi





