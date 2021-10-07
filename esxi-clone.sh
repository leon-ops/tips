#Prerequisite
# 1. Esxi installed
# 2. connect through ssh on the esxi
# 3. cd to DATASTORE path
#./clone.sh vm-src vm-dst, then go in UI, register the vm-dst, click on I copied the vm, and power on. That's all folks!
# syntax: ./clone.sh vm-src vm-dest
# DATA_STORE_PATH=/vmfs/volumes/myDataStore
#cd $DATA_STORE_PATH
echo "start cloning"
date
set -x
SRC=$1
DST=$2
cp -R ./$SRC $DST &&  cd $DST &&  vmkfstools -E $SRC.vmdk $DST.vmdk && mv $SRC.vmx $DST.vmx &&  sed -i "s/$SRC/$DST/" $DST.vmx

echo "end of cloning"
date

