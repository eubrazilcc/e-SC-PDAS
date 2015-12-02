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

if [ -z "$PROP__Delete_Physically" ] ; then DeleteType="logical" ; else DeleteType="physical" ; fi
if [ -z "$PROP__Is_Hidden" ] ; then Hidden="no" ; else Hidden="yes" ; fi

echo Running command:
echo $DEP__OphidiaTerminal__oph_term -j -u $PROP__User_Name -p ... -H $PROP__Server_Address -P $PROP__Server_Port -e "oph_deletecontainer container=$PROP__Container_Name;delete_type=$DeleteType;hidden=$Hidden"

STDOUT=$( mktemp dc-stdout-XXXX.txt )

$DEP__OphidiaTerminal__oph_term -j -u $PROP__User_Name -p $PROP__User_Password -H $PROP__Server_Address -P $PROP__Server_Port -e "oph_deletecontainer container=$PROP__Container_Name;delete_type=$DeleteType;hidden=$Hidden" > $STDOUT

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
