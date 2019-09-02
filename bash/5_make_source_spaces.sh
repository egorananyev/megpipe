#! /bin/bash

export SUBJECTS_DIR=/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/data/FreeSurfer

subjects=( `cat '/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/scripts/bash/subjects.txt' `)

for subject in "${subjects[@]}"

do

        mne_setup_source_space --subject $subject --ico 5 --overwrite

done