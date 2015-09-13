#!/bin/bash
#
# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia Apply
# 
# ------------------------------------------------------------
# The following environment variables are required to connect
# ------------------------------------------------------------

echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties
echo "container=$PROP__container" >> $OUTPUT__output_properties

if [ "$PROP__cube" == "" ];
	then
echo "Cannot execute without cube identifer"
		exit 1
	else 
		echo ""
fi

OUTFILE=$(mktemp apply-XXXX.csv)
echo $OUTFILE >> $OUTPUT__output_files

FILE=(apply-*.csv)

for f in $BLOCK_HOME/scripts/apply-*.csv; do

if [ -f "$FILE" ];  
then

PROP__cube=$(cat $INPUT__input_files | jq -c -r '.response.response[0].objcontent[0].message' | sed 's/[][]//g' )
$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_apply query=$PROP__query;cube=$PROP__cube;" | tee -a "$OUTFILE"

else
	echo "Not Completed."
fi
done

