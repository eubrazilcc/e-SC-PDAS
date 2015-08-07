#!/bin/bash
/usr/bin/printenv

# Pass input CSV data from input x -> output y
#


# Pass input files from input-files -> output-files. Literally, append file
# names from the input port to the file indicated by the output port variable.
# 
for f in "${INPUT__input_files__LIST[@]}" ; do
    echo "$f" >> $OUTPUT__output_files
done

OUTFILE=$( mktemp output-XXXX.csv )
echo $OUTFILE >> $OUTPUT__output_properties
#source $INPUT__input_files

echo "$PROP__u=jcala" >> $OUTPUT__u
echo "$PROP__p=password1" >> $OUTPUT__p
echo "$PROP__H=Host1" >> $OUTPUT__H
echo "$PROP__P=Port1" >> $OUTPUT__P

echo "$PROP__u=jcala" >> $OUTFILE
echo "$PROP__p=password" >> $OUTFILE
echo "$PROP__H=Host" >> $OUTFILE
echo "$PROP__P=Port" >> $OUTFILE





#cho "$INPUT__input_files" >> $OUTPUT__output_properties  # Import properties to the block
#at "$INPUT__input_files" >> $OUTPUT__output_properties  # Copy properties to the block



#$DEP__OphidiaTerminal__oph_term oph_term -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_createcontainer container=$PROP__container;dim=$PROP__dim;dim_type=$PROP__dim_type;hierarchy=$PROP__hierarchy;" | tee -a "$OUTFILE"



# echo "#!/bin/bash" > input2.txt

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

