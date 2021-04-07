# DREAM_2019
This is the code for solving the DREAM 2019 CHALLENGE QUESTION-"PREDICTING GESTATIONAL AGE USING MATERNAL WHOLE BLOOD TRANSCRIPTOMICS". Dataset had gene expresion 
values of about 735 patients divided into test and training dataset. My initial approach was to scan the medical literate for gene of interest, find its ENTREZ GENEID and 
take out the gene expression values corresponding to that gene and training a regression model on it. 

Then correlation test was used. Different regression models and packages were tried. 

Later on XGBOOST was used in Python to select the most suitable genes, and then the elastic net model of this code was trained and tested on them, which gave the best result. 

the XGBOOST code is written in Python and available on the other repo. 
