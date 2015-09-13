#!/bin/bash
#
# NOTED:CHANGED FOR TESTING PURPOSES  
#
# Block Name: Ophidia Container
# 
# Purpose: 
#    Perform to create a container
#
# Important Notes:
#    Below are 3 steps to configure this:
#
#    Please check you are not blocked by a firewall and are using an authorised network to connect to the PDAS terminal and you have authorised account to connect.
#    1) Set the login details on your local machine /etc/profile or .bashrc and have authorisation keys authenticated
#    2) Upload a file to insert the properties, u = username, p = password, H = host, P = port
#    3) Manually enter these in the block's property
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

if [ ! -z "$PROP__u" ];
  then 
	echo "A username has been provided."
else 
	echo "Sorry, a username has not been provided."
fi

if [ ! -z "$PROP__H" ];
  then 
	echo "The host connection is $PROP__H"
else 
	echo "Sorry, we are unable to find the host. Please check the input parameters."
fi

if [ ! -z "$PROP__P" ];
  then 
	echo "The port connection is $PROP__H"
else 
	echo "Sorry, we are unable to find the port number. Please verify the port number is correct or try again later."
fi

if [ ! -z "$PROP__container" ];
  then
	echo "Container name is: $PROP__container"
else
	echo "Container name is empty"
fi

if [ "$PROP__u" != "" ] && [ "$PROP__p" != "" ] && [ "$PROP__H" != "" ] && [ "$PROP__P" != "" ];
then
	echo "Login Details Complete."
else
	echo "Login Requirements not completed."
fi

EXIT=$?

ping -W $PROP__W -c $PROP__C $PROP__H; >/dev/null;   #count 3 is sufficient to reduce the workflow process
if [ "$EXIT" -eq 0 ];
  then
	echo "Connection response to $PROP__H Ophidia host address is active"
	echo "Connecting..."
	
else 
	echo "Sorry, no connection response is retrieved from $PROP__H Ophidia server, please try again later."

fi



OUTFILE=$(mktemp container-XXXX.csv)
echo "$INPUT__input_files" >> $OUTPUT__output_properties  ##send properties to output

	echo "Creating a container will be made. The parameters you have inserted:"   ###possible for-loop on this 
	echo "Container Name: $PROP__container"
	echo "Dimensions: $PROP__dim"
	echo "Dimension Type: $PROP__dim_type"
	echo "Hierarchy: $PROP__hierarchy"

$DEP__OphidiaTerminal__oph_term oph_term -j -u $1 $PROP__u -p $2 $PROP__p -H $3 $PROP__H -P $4 $PROP__P -e "oph_createcontainer container=$PROP__container;dim=$PROP__dim;dim_type=$PROP__dim_type;hierarchy=$PROP__hierarchy;" | tee -a "$OUTFILE"

if [ $? -eq 0 ];  
  then 
   	echo "Creating container..."
else
	echo "Sorry, creating container is not possible. Please check input."   ##Container lookup
fi

STATUS__ONE=$(cat $OUTFILE | jq -c -r '.response.response[0].objcontent[0].title' ) 
STATUS__TWO=$(cat $OUTFILE | jq -c -r '.response' ) 

if [ "$STATUS__ONE" == "SUCCESS" ];
then
	echo "Execution successful"
else
	echo -e "\n\n Execution failed"
	echo "Container name may already exists"
fi

inputParameters=$INPUT__input_files
inputParameters=$(cat $INPUT__input_files)

for v in "${inputParameters[@]}"
  do
  echo "$v" >> $OUTPUT__output_properties 
done

createContainer1=""  
createContainer2="$PROP__container"   
createContainer3=" "   

case $PROP__container in  
	"$createContainer1") 
		echo "Container name is empty, please rename the container. Thank you ";;
	"$createContainer2")
		echo "Container name is identical to the original container name, please rename this container or the original. Thank you ";;
	"$createContainer3")	
		echo "Container name is empty , please rename this container or the original. Thank you";;
	*) 	echo "Please make sure all container names are different before creating container.";;
esac




