#!/bin/bash
# example scp commands for getting files from a server
scp -prP 402 steve@serveraddress.internets.edu:/home/steve/Resume /home/steve/Resume/server_files/Resume_Backup/

####

scp -prP 402 steve@serveraddress.internets.edu:/home/steve/\{AlgaeBeamer,BIOL215_FALL2014,BIOL216_Sp2015,ChIP_Seq_DataMining.Rnw,ChIP_Seq_DataMining.pdf,Exp_B_DNA_Extract,ExpD_HPL3isol,ExpF_B12ELISA,Exp_H_algae,Exp_I_algaemixed,ExpJ_Thal,Exp_K_Chaet,Exp_M_miniThal,ExpO_MixedCultureII,Final_Exam_Bioinformatics,ghostscript_instructions.txt,steve_backup.zip,LaTeX_article,LaTeX_BaPoster_example,Latex_Cheat_Sheet.pdf,LaTeX_ConferencePoster_1,LaTeX_examples,LaTeX_lab_report,Magda_SUSRC2015,Mat506_BiostatsMyFirstLatexDoc_sample,NAR.bst,Normality.R,NormalityTestNotes.txt,OLD_CODES.R,oldcodes.TXT,Old_Exams,OLD_FILES,par.txt,PlateReaderTest,predictR,predict.R,Primitives,RbloggerTests.R,references_9Sep14.bib,references.bib,rreferences.bib,SK_Code_Sample_v2-2.1.pdf,StandardCurveHelper_BETA.R,stringr.R,TEDCO\} /home/steve/server_misc

scp -prP 402 steve@serveraddress.internets.edu:/home/steve/\{Thesis,Thesis_v2\} /home/steve/server_misc

ssh steve@serveraddress.internets.edu -p 402 find /home/steve/ find -type f -size +100M

ls -R /path | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }'

# this is wrong
SMALLserverFILES="ssh steve@serveraddress.internets.edu -p 402 find /home/steve/ find -type f -size -100M"

# use this
ssh steve@serveraddress.internets.edu -p 402 find /home/steve/ -type f -size +90M

# don't use this the 
ssh steve@serveraddress.internets.edu -p 402 ls -lR | awk '                             
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }'

# use this
ssh steve@serveraddress.internets.edu -p 402 ls -R | awk '                             
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }'


rsync --max-size=500M

Access via remote shell:
         Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]

rsync -avzheR ssh --port=402 --progress --max-size='500M' --dry-run steve@serveraddress.internets.edu:/home/steve/ /home/steve/server



rsync -avzheR --progress --max-size='50M' --dry-run -e "ssh -p 402" steve@serveraddress.internets.edu:/home/steve/ /home/steve/server/

rsync -avzheR --progress --max-size='1M' --dry-run -e "ssh -p 402" steve@serveraddress.internets.edu:/home/steve/ /home/steve/server/

rsync -avzheR --progress --max-size=1M --dry-run -e "ssh -p 402" steve@serveraddress.internets.edu:/home/steve/ /home/steve/server/


# used this one here
rsync -avzheR --progress --max-size=100M -e "ssh -p 402" steve@serveraddress.internets.edu:/home/steve/ /home/steve/server/



#####

scp -prP 402 steve@serveraddress.internets.edu:/home/steve/\{AlgaeBeamer,BIOL215_FALL2014,BIOL216_Sp2015,ChIP_Seq_DataMining.Rnw,ChIP_Seq_DataMining.pdf,Exp_B_DNA_Extract,ExpD_HPL3isol,ExpF_B12ELISA,Exp_H_algae,Exp_I_algaemixed,ExpJ_Thal,Exp_K_Chaet,Exp_M_miniThal,ExpO_MixedCultureII,Final_Exam_Bioinformatics,ghostscript_instructions.txt,steve_backup.zip,LaTeX_article,LaTeX_BaPoster_example,Latex_Cheat_Sheet.pdf,LaTeX_ConferencePoster_1,LaTeX_examples,LaTeX_lab_report,Magda_SUSRC2015,Mat506_BiostatsMyFirstLatexDoc_sample,NAR.bst,Normality.R,NormalityTestNotes.txt,OLD_CODES.R,oldcodes.TXT,Old_Exams,OLD_FILES,par.txt,PlateReaderTest,predictR,predict.R,Primitives,RbloggerTests.R,references_9Sep14.bib,references.bib,rreferences.bib,SK_Code_Sample_v2-2.1.pdf,StandardCurveHelper_BETA.R,stringr.R,TEDCO\} /home/steve/server_misc

scp -prP 402 steve@serveraddress.internets.edu:/home/steve/\{Thesis,Thesis_v2\} /home/steve/server_misc
