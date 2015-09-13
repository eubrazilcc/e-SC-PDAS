#!/bin/bash
#
# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia Aggregate
# 
# ------------------------------------------------------------
# The following environment variables are required to connect
# ------------------------------------------------------------

OUTFILE=$( mktemp aggregate-XXXX.csv )
echo $OUTFILE >> $OUTPUT__output_files 

echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties
echo "container=$PROP__container" >> $OUTPUT__output_properties


OUTFILE=$(mktemp aggregate-XXXX.csv)
echo $OUTFILE >> $OUTPUT__output_files

FILE=(aggregate-*.csv)

for f in $BLOCK_HOME/scripts/aggregate-*.csv; do

if [ -f "$FILE" ];  
then

PROP__cube=$(cat $INPUT__input_files | jq -c -r '.response.response[0].objcontent[0].message' | sed 's/[][]//g' )

$DEP__OphidiaTerminal__oph_term oph_term -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_aggregate operation=$PROP__operation;" | tee -a "$OUTFILE" 

else
	echo "not done"
	fi
done

if [ "$PROP__operation" != "max" ] && [ "$PROP__operation" != "min" ] && [ "$PROP__operation" != "sum" ] && [ "$PROP__operation" != "avg" ]; then
echo "The operation $PROP__operation did not execute. Please make sure you selected the right operation"
else
$DEP__OphidiaTerminal__oph_term oph_term -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_aggregate operation=$PROP__operation;" | tee -a "$OUTFILE" 
fi

if [ "$PROP__objkey_filter" != "all" ] && [ "$PROP__objkey_filter" != "none" ] && [ "$PROP__objkey_filter" != "aggregate" ]; then
echo "The operation $PROP__objkey_filter did not execute. Please make sure you selected the right value"
else
fi
