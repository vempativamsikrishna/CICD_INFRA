#!/bin/bash
packer version
packer validate packer.json
if [ $? -eq 0 ]
then
echo "Validation successful. Lets build the code"
packer build packer.json 2>&1 | tee output.txt
tail -4 output.txt | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ami.txt
AMIID=$(cat ami.txt)
echo "variable \"imagename\" { default = \"$AMIID\" }" >> variables.tf
terraform init
terraform plan
else
echo "Validation Faild.Please check the code"
exit 1
fi
