#!/bin/bash

#PBS -N test-sra-array
#PBS -l walltime=00:10:00
#PBS -J 1-4
#PBS -j oe
#PBS -S /bin/bash
#PBS  -V  

module purge

module load   ohpc 

module load bowtie2 samtools bcftools  htslib sratoolkit STAR/2.6.1c  
 
cd  $PBS_O_WORKDIR  

env | grep PBS 


INPUTFILE_DIR="$PWD"

mkdir -p  $INPUTFILE_DIR/tmpdir

cp /data/program/sample-data/sratoolkit/*.sra  $INPUTFILE_DIR/tmpdir 

INPUTFILES=($INPUTFILE_DIR/tmpdir/SRR384905.sra $INPUTFILE_DIR/tmpdir/SRR384905_1.sra $INPUTFILE_DIR/tmpdir/SRR384905_2.sra $INPUTFILE_DIR/tmpdir/SRR384905_3.sra)

PROJECT_SUBDIR=myarrayjob

INPUTFILENAME="${INPUTFILES[$PBS_ARRAY_INDEX - 1]}"

WORKING_DIR="$INPUTFILE_DIR/$PROJECT_SUBDIR/$PBS_JOBID/$USER"

if [ ! -d "$WORKING_DIR" ]; then
	mkdir -p $WORKING_DIR
fi


DESTINATION_DIR="$INPUTFILE_DIR/sra_archive/$PROJECT_SUBDIR/$PBS_JOBID"

if [ ! -d "$DESTINATION" ]; then
	mkdir -p $DESTINATION_DIR
fi

cp  $INPUTFILENAME $WORKING_DIR

cd $WORKING_DIR

fastq-dump -split-files $INPUTFILENAME

cp * $DESTINATION_DIR

#rm -rf $PBS_JOBID
#rm -rf $WORKING_DIR
#rm -rf $INPUTFILE_DIR/tmpdir   


