#! /bin/bash

export SUBJECTS_DIR=/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/data/FreeSurfer
subjects=( `cat '/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/scripts/bash/subjects.txt' `)

for subject in "${subjects[@]}"

do

	echo 'Making BEM solution for SUBJECT: '$subject
	cd $SUBJECTS_DIR/$subject/bem

	mne_watershed_bem --subject $subject --overwrite
	ln -sf $SUBJECTS_DIR/$subject/bem/watershed/${subject}_inner_skull_surface $SUBJECTS_DIR/$subject/bem/inner_skull.surf
	ln -sf $SUBJECTS_DIR/$subject/bem/watershed/${subject}_outer_skin_surface $SUBJECTS_DIR/$subject/bem/outer_skin.surf
	ln -sf $SUBJECTS_DIR/$subject/bem/watershed/${subject}_outer_skull_surface $SUBJECTS_DIR/$subject/bem/outer_skull.surf
	ln -sf $SUBJECTS_DIR/$subject/bem/watershed/${subject}_brain_surface $SUBJECTS_DIR/$subject/bem/brain_surface.surf

done