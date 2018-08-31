
#!/bin/bash

# ========================================
# This script is used to correct the 10 minutes raw files from Geobit Digitizers from bleaching
# ========================================

# Define path to data
path2dat=/media/ugonanni/Nanni/DATA_ARG_backup/ARG_Borehole_Ugo/
path2mseed=$path2dat/MSEED
path2sac=$path2dat/SAC/SAC_raw
path2sacpro=$path2dat/SAC/SAC_corrected

# Sac files with bleach event are characterized by starting after 03 secondes
name_sp=003 # files with the spike
name_tmp=cut # after cutting the spike
name_nsp=000 # files with no spike
name_mer=mer # merged files

# ========================================
# Step 1: search for all files with '03.SAC'

find *$name_sp*.SAC > spike_files_list.txt

# loop over the file list
for file in `cat spike_files_list.txt`
  echo $file





