#!/bin/bash

if [[ -s motif6.motif ]] ; then
echo "file has data."
else
echo "FILE is empty."
fi ;

# this works
if [[ -n $(grep -Fl Jaspar *.motif) ]] ; then
echo "files have data."
else
echo "FILE are empty."
fi ;

# this works too
if [[ -n $(grep -Fl Jaspar *.motif) ]] ; then
echo "files have data."
grep -Fl Jaspar *.motif
else
echo "FILE are empty."
fi ;

cd /home/kellys/ChIP_Seq_Magda_completeWorkflow/RegulatedGene_Motifs/Down_TSS/homerResults
if [[ -n $(grep -Fl _AR *.motif) ]] ; then
echo "files have data."
grep -Fl Jaspar *.motif
else
echo "FILE are empty."
fi ;

<<Just_The_Motif_U_Want2,engine='bash',results='hide',eval=TRUE>>=  
AR_full="MA0007.2_AR"

MotifDir="/home/kellys/ChIP_Seq_Magda_completeWorkflow/RegulatedGene_Motifs"

UpMotifFile="/home/kellys/ChIP_Seq_Magda_completeWorkflow/RegulatedGene_Motifs/cat_UpReg_motifs_AR_TSS.txt"
DownMotifFile="/home/kellys/ChIP_Seq_Magda_completeWorkflow/RegulatedGene_Motifs/cat_DownReg_motifs_AR_TSS.txt"

cd $MotifDir/Down_TSS/homerResults/
  
if [[ -n $(grep -Fl $AR_full *.motif) ]] ; then
cat $(grep -Fl $AR_full *.motif) > $DownMotifFile
cd /home/kellys/ChIP_Seq_Magda_completeWorkflow
findMotifsGenome.pl DownRegulated_ARpeaks.txt hg19 $MotifDir/Down_TSS/optimizedAR/ -size 200 -p 30 -opt $DownMotifFile
cd $MotifDir/Down_TSS/optimizedAR/homerResults
MOTIF_FILE=$(grep -Fl $AR_full *.motif)
cp ${MOTIF_FILE%.*}.logo.png $MotifDir/DownRegARmotif_TSS.png
else
echo "AR motif not found"
fi ;

cd $MotifDir/Up_TSS/homerResults/

if [[ -n $(grep -Fl $AR_full *.motif) ]] ; then
cat $(grep -Fl $AR_full *.motif) > $UpMotifFile
cd /home/kellys/ChIP_Seq_Magda_completeWorkflow
findMotifsGenome.pl UpRegulated_ARpeaks.txt hg19 $MotifDir/Up_TSS/optimizedAR/ -size 200 -p 30 -opt $UpMotifFile
cd $MotifDir/Up_TSS/optimizedAR/homerResults
MOTIF_FILE=$(grep -Fl $AR_full *.motif)
cp ${MOTIF_FILE%.*}.logo.png $MotifDir/UpRegARmotif_TSS.png
else
echo "AR motif not found"
fi ;


@
