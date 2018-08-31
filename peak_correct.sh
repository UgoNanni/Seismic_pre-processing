
#!/bin/bash

# ========================================
# This script is used to correct the 10 minutes raw files from Geobit Digitizers from bleaching
# ========================================

# Define path to data
path2dat=/media/ugonanni/Nanni/DATA_ARG_backup/ARG_Borehole_Ugo/
path2mseed=$path2dat/MSEED/
path2sacsp=$path2dat/SAC/SAC_spikes/
path2sacraw=$path2dat/SAC/SAC_raw/
path2sacclean=$path2dat/SAC/SAC_cleaned/

spfiles=spike_files_list

# Sac files with bleach event are characterized by starting after 03 secondes
name_sp=03 # files with the spike
name_tmp=cut # after cutting the spike
name_nsp=000 # files with no spike
name_mer=mer # merged files

# ========================================
# Step 1: search for all files with '03.SAC'

find $path2sacraw -name *$name_sp*.SAC* > $spfiles

# loop over the file list
for file in `cat $spfiles`
do
  echo $file
  new_file=`echo $file | sed -e 's#3.SAC#0.SAC#g'
  cp $new_file $path2sacsp

sac <<EOF
r $file $new_file
merge overlap average gap interp
w tmp.SAC
cut B 0 575
r tmp.SAC
cut off
w $new_file
quit
EOF

  mv $file $path2sacsp

done






