# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia DeleteCube
# Author: William Ng
#
# ------------------------------------------------------------
# The following environment variables are required to connect
# ------------------------------------------------------------

#!/bin/bash

echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties

echo "container=$PROP__container" >> $OUTPUT__output_properties
echo "cube=$PROP__cube" >> $OUTPUT__output_properties


if [ "$PROP__container" == "" ];
then
echo "Container has not been identified. Please check if you have input a validate container name."
else
$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_delete cube=[container=$PROP__cube];"
fi
