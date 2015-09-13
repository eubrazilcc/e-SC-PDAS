#!/bin/bash

echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties

echo "container=$PROP__container" >> $OUTPUT__output_properties
echo "cube=$PROP__cube" >> $OUTPUT__output_properties
echo "cube2=$PROP__cube2" >> $OUTPUT__output_properties

OUTFILE=$(mktemp intercube-XXXX.csv)
echo $OUTFILE >> $OUTPUT__output_files

FILE=(intercube-*.csv)

for f in $BLOCK_HOME/scripts/intercube-*.csv; do

if [ -f "$FILE" ];  
then

PROP__cube=$(cat $INPUT__input_files | jq -c -r '.response.response[0].objcontent[0].message' | sed 's/[][]//g' )
$DEP__OphidiaTerminal__oph_term oph_term -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_intercube cube=$PROP__cube;cube2=$PROP__cube2" | tee -a "$OUTFILE"

else
echo "Not completed."
fi
done
