#!/bin/bash

## Issue of cube id passing resolved with use of additional use of file-wrapper implementations.
## Changed on all blocks
## Implementations on all blocks has been changed to fix the cube id and explore issue.  

OUTFILE=$( mktemp output-XXXX.txt )   ###subject to change depending on the output 
echo $OUTFILE >> $OUTPUT__output_properties ### possible later test


###### ImportCube.sh########
function count()
{
if [ "$PROP__u" != "" ] && [ "$PROP__p" != "" ] && [ "$PROP__H" != "" ] && [ "$PROP__P" != "" ];
then
  echo "Authorisation completed."
  echo "Welcome $PROP__u."
else
  echo "Sorry, connection invalid. Please enter all the valid log-in details"
fi
}
count

function checkCubeName()
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

function checkParameters()
{
check="$PROP__container $PROP__host_partition $PROP__cwd $PROP__measure $PROP__scr_path $PROP__exp_dim $PROP__imp_dim"

for parameter in $check
do

if [ "${parameter}" != "" ]
then
  importNC
exit 0
else
  echo "You need to fill in all the mandatory parameters required."
exit 1
fi
done
}
checkParameters

function importNC()
{
var_mandatory="container=$PROP__container;host_partition=$PROP__host_partition;cwd=$PROP__cwd;measure=$PROP__measure;src_path=$PROP__scr_path;exp_dim=$PROP__exp_dim;imp_dim=$PROP__imp_dim;"
var_non_mandatory="sessionid=$PROP__sessionid;ncores=$PROP__ncores;exec_mode=$PROP__exec_mode;ioserver=$PROP__ioserver;import_metadata=$PROP__import_metadata;schedule=$PROP__schedule;nhost=$PROP__nhosts;ndbms=$PROP__ndbms;ndb=$PROP__ndb;nfrag=$PROP__nfrag;run=$PROP__run;subset_dims=$PROP__subset_dims;subset_type=$PROP__subset_type;subset_filter=$PROP__subset_filter;exp_concept_level=$PROP__exp_concept_level;imp_concept_level=$PROP__imp_concept_level;compressed=$PROP__compressed;grid=$PROP__grid;objkey_filter=$PROP__objkey_filter;"
var_parameters="$var_mandatory $var_non_mandatory"

  $DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_importnc $var_parameters"
}
importNC
