#!/bin/bash
#
# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia ImportCube
# 
# ------------------------------------------------------------
# The following environment variables are required to connect
# ------------------------------------------------------------

echo "u=$PROP__u" >> $OUTPUT__output_properties
echo "p=$PROP__p" >> $OUTPUT__output_properties
echo "H=$PROP__H" >> $OUTPUT__output_properties
echo "P=$PROP__P" >> $OUTPUT__output_properties
echo "container=$PROP__container" >> $OUTPUT__output_properties
echo "cube=$PROP__cube" >> $OUTPUT__output_files

OUTFILE=$(mktemp cube-XXXX.csv)
echo $OUTFILE >> $OUTPUT__output_files

if [ "$PROP__u" != "" ] && [ "$PROP__p" != "" ] && [ "$PROP__H" != "" ] && [ "$PROP__P" != "" ];
then
  echo "Authorisation completed."
else
  echo "Sorry, connection invalid. Please enter all the valid log-in details"
fi

if [ "$PROP__container" == "$PROP__importcontainer" ]
then
  echo "Cube name is identical to container"
else 
  echo "Please make sure you selected the same cube name to the container"
exit 1
fi

$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_importnc container=$PROP__importcontainer;exp_dim=$PROP__exp_dim;host_partition=$PROP__host_partition;imp_dim=$PROP__imp_dim;measure=$PROP__measure;src_path=$PROP__src_path;compressed=$PROP__compressed;exp_concept_level=$PROP__exp_concept_level;filesystem=$PROP__filesystem;imp_concept_level=$PROP__imp_concept_level;ndb=$PROP__ndb;ndbms=$PROP__ndbms;nhost=$PROP__nhost;subset_filter=$PROP__subset_filter;subset_dims=$PROP__subset_dims;subset_type=$PROP__subset_type;cube=$PROP__cube;" | tee -a "$OUTFILE" 

###local machine testings
checkConditions () 
{

case "$1" in
     [a-zA-Z]*) 
	     return $SUCCESS;;
	[0-9]*)
	     return $SUCCESS;; 
 [!a-zA-Z]*) 
             return $EXIT;;
	  *) 
	     return $NULL;;
esac
}

printOutput()
{

if checkConditions "$@"
then
	echo "$* [CHECK]"
else
	echo "$* [UNCHECK]"   ##### uncheck is for null
fi
		
}

while read p; 
do
   printOutput $p
done <$INPUT__input_files

PROP__status=$(cat $OUTFILE | jq -c -r '.response.response[2].objcontent[0].title' )


for f in $BLOCK_HOME/scripts/cube-*.csv; do

if [ $PROP__status == "SUCCESS" ];
then
	echo "$PROP__status: Cubes Deletion successful"
else
	echo -e "\n\n$PROP__status: Execution failed."
	echo "Cubes cannot be deleted."
fi

while read line $INPUT__input_files
do
if [ "$PROP__container" == "$PROP__importcontainer" ];
then
  echo "Importing cube into $PROP__container" >&2
else
  echo "Invalid. Importing cube $PROP__importcontainer into wrong container. "
  echo "Cube: $PROP__importcontainer"
  echo "Container: $PROP__container"
fi
