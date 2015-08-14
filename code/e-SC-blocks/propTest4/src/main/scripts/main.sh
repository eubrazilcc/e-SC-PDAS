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

#source $INPUT__input_files

#echo "$PROP__u=jcala" >> $OUTPUT__u
#echo "$PROP__p=password1" >> $OUTPUT__p
#echo "$PROP__H=Host1" >> $OUTPUT__H
#echo "$PROP__P=Port1" >> $OUTPUT__P

#echo "$PROP__u=jcala" >> $OUTFILE
#echo "$PROP__p=password" >> $OUTFILE
#echo "$PROP__H=Host" >> $OUTFILE
#echo "$PROP__P=Port" >> $OUTFILE

#echo "$INPUT__input_files" >> $OUTPUT__output_properties  # Import properties to the block
#cat "$INPUT__input_files" >> $OUTPUT__output_properties  # Copy properties to the block

#$DEP__OphidiaTerminal__oph_term oph_term -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_createcontainer container=$PROP__container;dim=$PROP__dim;dim_type=$PROP__dim_type;hierarchy=$PROP__hierarchy;" | tee -a "$OUTFILE"

# echo "#!/bin/bash" > input2.txt

