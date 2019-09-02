#! /bin/bash

export SUBJECTS_DIR=/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/data/FreeSurfer
data_path=/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/data
subjects=( `cat '/home/lau/analyses/omission_frontiers_BIDS-MNE-Python/scripts/bash/subjects.txt' `)

for subject in "${subjects[@]}"

do

	dicom_path=${data_path}/${subject}/ses-mri/anat/
	cd $dicom_path
	first_dicom_file=$(ls | head -n 1)
	recon-all -subjid $subject -i $first_dicom_file -openmp 32

done