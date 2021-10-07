# syntax: ./clone.sh vm-src vm-dest
# DATA_STORE_PATH=/vmfs/volumes/myDataStore
#cd $DATA_STORE_PATH
set -x
SRC=$1
DST=$2
cp -dpR ./$SRC $DST &&  cd $DST &&  vmkfstools -E $SRC.vmdk $DST.vmdk && mv $SRC.vmx $DST.vmx &&  sed -i "s/$SRC/$DST/" $DST.vmx
