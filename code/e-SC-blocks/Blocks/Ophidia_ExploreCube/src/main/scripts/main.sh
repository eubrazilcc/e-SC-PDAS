#!/bin/bash
#
# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia ExploreCube
# 
# ------------------------------------------------------------
# The following environment variables are required to connect
# ------------------------------------------------------------


echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties
echo "container=$PROP__container" >> $OUTPUT__output_properties
echo "cube=$PROP__cube" >> $OUTPUT__output_properties


FILETWO=file2.dat
FILETHREE=output.dat

OUTFILE=$(mktemp output-XXXX.csv)
echo $FILETHREE >> $OUTPUT__output_files


FILE=(output-*.csv)

for f in $BLOCK_HOME/scripts/output-*.csv; do

if [ -f "$FILE" ];  
then

PROP__cube=$(cat $INPUT__input_files | jq -c -r '.response.response[0].objcontent[0].message' | sed 's/[][]//g' ) #cat###$INPUT__input_files??  ###$INPUT__input_properties

$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_explorecube cube=$PROP__cube;limit_filter=$PROP__limit_filter;" | tee -a "$FILETWO"

#cat $FILETWO | jq -c -r '.response[0].objcontent[0].rowvalues[range(0;100)]' | sed 's/[]""[]//g' > "$FILETHREE"
cat $FILETWO | jq -c -r ".response.response[0].objcontent[0].rowvalues[range(0;100)]" | sed 's/[],""[ ]/ /g' | sed 's/, //g' | awk "{print "$test" }" > "$OUTFILE"
cat $OUTFILE > $FILETHREE

#echo "$PROP__cube" | tee -a "$OUTFILE" 
else
echo "not done"
fi
done
