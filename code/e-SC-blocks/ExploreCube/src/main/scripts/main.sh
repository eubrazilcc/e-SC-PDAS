#!/bin/bash

# Copyright 2014-2015 EUBrazilCC (EU‐Brazil Cloud Connect)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 2 as published by the Free Software Foundation at:
# http://www.gnu.org/licenses/gpl-2.0.html
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, 5th Floor, Boston, MA 02110-1301, USA.
#

# Need to add ; at the end of variables because oph_term does not like ;; tokens
if [ -z "$PROP__Cube_Name" ] ; then Cube="" ; else Cube="cube=$PROP__Cube_Name;" ; fi
if [ -z "$PROP__Subset_Dimensions" ] ; then SubsetDims="" ; else SubsetDims="subset_dims=$PROP__Subset_Dimensions;" ; fi
if [ -z "$PROP__Subset_Filter" ] ; then SubsetFilter="" ; else SubsetFilter="subset_filter=$PROP__Subset_Filter;" ; fi
if [ -z "$PROP__Show_Id" ] ; then ShowId="" ; else ShowId="show_id=yes;" ; fi
if [ -z "$PROP__Show_Index" ] ; then ShowIndex=""; else ShowIndex="show_index=yes;" ; fi
if [ -z "$PROP__Show_Time" ] ; then ShowTime="" ; else ShowTime="show_time=yes;" ; fi

echo Running command:
echo $DEP__OphidiaTerminal__oph_term -j -u $PROP__User_Name -p ... -H $PROP__Server_Address -P $PROP__Server_Port -e "oph_explorecube ${Cube}${SubsetDims}${SubsetFilter}${ShowId}${ShowIndex}${ShowTime}limit_filter=$PROP__Limit_Filter;ncores=$PROP__Core_No_;objkey_filter=$PROP__Object_Key_Filter;${SessionId}"

STDOUT=$( mktemp inc-stdout-XXXX.txt )

# Note that the JSON output is broken for longer responses (at about 2000+ rows), so we use regular text output and convert it accordingly
$DEP__OphidiaTerminal__oph_term -j -u $PROP__User_Name -p $PROP__User_Password -H $PROP__Server_Address -P $PROP__Server_Port -e "oph_explorecube ${Cube}${SubsetDims}${SubsetFilter}${ShowId}${ShowIndex}${ShowTime}limit_filter=$PROP__Limit_Filter;ncores=$PROP__Core_No_;objkey_filter=$PROP__Object_Key_Filter;${SessionId}" > $STDOUT

OPH_EXIT_CODE=$?

if [ $OPH_EXIT_CODE -ne 0 ] ; then
    echo Ophidia terminal error: $OPH_EXIT_CODE
    exit $OPH_EXIT_CODE
fi

# Check if response is SUCCESS
OPH_RESPONSE=$( < $STDOUT jq -r -c '.response.response[].objcontent[].title | select(. == "SUCCESS")' )
echo Ophidia response: $OPH_RESPONSE

if [ "$OPH_RESPONSE" != "SUCCESS" ] ; then
    cat $STDOUT | jq -r -c '.response.response[0].objcontent[0].message'
    exit 1
fi

if [ "$PROP__Output_Format" == "json" ] ; then
    CUBEOUT=$( mktemp cube-data-XXXX.json )
    < $STDOUT jq -r -c '.response.response[0].objcontent[]' > $CUBEOUT
elif [ "$PROP__Output_Format" == "csv" ] ; then
    CUBEOUT=$( mktemp cube-data-XXXX.csv )
    < $STDOUT jq -r -c '.response.response[0].objcontent[] | .rowkeys, .rowvalues[] | @csv' > $CUBEOUT
else
    echo "Unsupported output type: $PROP__Output_Format"
fi

echo Generated output file $CUBEOUT
echo $CUBEOUT >> $OUTPUT__cube_data
