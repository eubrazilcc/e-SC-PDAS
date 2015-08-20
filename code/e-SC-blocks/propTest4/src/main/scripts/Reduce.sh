#!/bin/bash

$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_reduce2 operation=$PROP__operation;dim=$PROP__dim;concept_level=$PROP__concept_level;cube=$PROP__cube;" | tee -a "$OUTFILE"

Update coming
