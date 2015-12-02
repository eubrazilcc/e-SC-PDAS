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

if [ -z "$PROP__Data_Compression" ] ; then Compressed="no" ; else Compressed="yes" ; fi

echo Running command:
echo $DEP__OphidiaTerminal__oph_term -j -u $PROP__User_Name -p ... -H $PROP__Server_Address -P $PROP__Server_Port -e "oph_createcontainer container=$PROP__Container_Name;dim=$PROP__Dimension_Names;dim_type=$PROP__Dimension_Types;hierarchy=$PROP__Dimension_Hierarchies;compressed=$Compressed;base_time=$PROP__Base_Time;calendar=$PROP__Calendar_Type;units=$PROP__Time_Units"

STDOUT=$( mktemp cc-stdout-XXXX.txt )

$DEP__OphidiaTerminal__oph_term -j -u $PROP__User_Name -p $PROP__User_Password -H $PROP__Server_Address -P $PROP__Server_Port -e "oph_createcontainer container=$PROP__Container_Name;dim=$PROP__Dimension_Names;dim_type=$PROP__Dimension_Types;hierarchy=$PROP__Dimension_Hierarchies;compressed=$Compressed;base_time=$PROP__Base_Time;calendar=$PROP__Calendar_Type;units=$PROP__Time_Units" > $STDOUT

OPH_EXIT_CODE=$?

if [ $OPH_EXIT_CODE -ne 0 ] ; then
    echo Ophidia terminal error: $OPH_EXIT_CODE
    exit $OPH_EXIT_CODE
fi

# Check if response is SUCCESS
OPH_RESPONSE=$( cat $STDOUT | jq -r -c '.response.response[].objcontent[].title | select(. == "SUCCESS")' )
echo Ophidia response: $OPH_RESPONSE

if [ "$OPH_RESPONSE" != "SUCCESS" ] ; then
    cat $STDOUT | jq -r -c '.response.response[0].objcontent[0].message'
    exit 1
fi

ContainerId=$( cat $STDOUT | jq -r -c '.response.response[].objcontent[] | select (.title == "Output Container").message' )

echo "User\ Name = $PROP__User_Name" >> $OUTPUT__properties
echo "User\ Password = $PROP__User_Password" >> $OUTPUT__properties
echo "Server\ Address = $PROP__Server_Address" >> $OUTPUT__properties
echo "Server\ Port = $PROP__Server_Port" >> $OUTPUT__properties
echo "Container\ Name = $PROP__Container_Name" >> $OUTPUT__properties
echo "ContainerId = $ContainerId" >> $OUTPUT__properties
