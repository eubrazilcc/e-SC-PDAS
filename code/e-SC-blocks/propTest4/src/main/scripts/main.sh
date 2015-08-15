#!/bin/bash

##Removed, conflicting with author's code, issue of cube id passing resolved with use of additional use of file-wrapper implementations.
## Changed on all blocks

##Implementations on all blocks has been changed to fix the cube id and explore issue.  

OUTFILE=$( mktemp output-XXXX.txt )   ###subject to change depending on the output 
echo $OUTFILE >> $OUTPUT__output_properties ### possible later test

for f in $BLOCK_HOME/scripts/output-*.txt; do
cat $INPUT__input_files > "$OUTFILE"
done

# INPUTFILE=$BLOCK_HOME/scripts/input2.txt
# echo $INPUTFILE >> $OUTPUT__output_properties

# INFILE=$BLOCK_HOME/scripts/input2.txt

# if [ -f "$INFILE" ]; 
# then
# cat $INPUT__input_files $INPUTFILE
#cp $INPUT__input_files $INPUTFILE
# echo "complete"
# cat $INPUTFILE
# else
# echo "not done"
# fi

###### ImportCube.sh
function checkCubeName
{
if [ "$PROP__cubeName" == "$PROP__container" ]
then
  echo "Cube name is identical to container"
  importCube
exit 0
else 
  echo "Please make sure you selected the same cube name to the container"
exit 1
fi
}

checkCubeName

function importCube
{
$DEP__OphidiaTerminal__oph_term oph_term -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e ""
}

