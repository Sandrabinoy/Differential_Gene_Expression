# Differential_Gene_Expression
This is only an easier way to perform all the steps required for Differential Gene Expression and to analyse those DEGs. The scripts and datasets are resources acquired from various resources (They're all mentioned with attached websites that would lead you to those resources).

R Script to perform differential gene expression on the acquired samples (365 samples from Glioma patients)-in relation to the paper https://www.nature.com/articles/sdata201724

The datasets along with the R script can be found here: https://doi.org/10.6084/m9.figshare.c.3594560.v1.
Make sure to download: CGGA_Gene_Expression_Profile_FPKM.txt AND Patient_Characteristics.txt.
The R script can be downloaded if you would only like to perform Differential Gene Expression.


RNA-seq analysis can be performed on the genes that are retrieved after the differential gene expression.



Geting started:

It is highly recommended to read the paper attached. It explains how the dataset was obtained. I've tried some of the steps mentioned in there (There's something called accession number which can be used on the NCBI website https://www.ncbi.nlm.nih.gov/sra to look for raw samples that are similar, if not the same to the dataset that is being used in the paper. So any of the datasets that are displayed can be downloaded with the help of the accession number of the dataset you require) using a software called samtools, which runs on command line.These raw data are then converted to fastq files using samtools, to perform quality check on them. Another software named FastQC can be used to perform the quality validation. But softwares like trimmommatic (used to improve the quality of the reads by trimming the sequence reads-learn more about it if it interests you) requires quite some hardware capabilities and patience, which was a constraint on this end. All these steps are mostly useful if one has obtained the RNAs with all the process that goes on in the laboratory. That was not necessary as a perfect set of data with all the samples with their genes and reads are available.

There are over 17,000 genes that can be seen on the dataset. Differential Gene Expression is performed on these to segregate them based on their levels of expression in terms of p-values in the new file. A better understanding on what to do with these p-values is highly recommended. 

The genes can obviously be analysed based on their values. Which is what I did. Used a couple of genes that were present in the files with the differentially expressed genes between grades 2 and 4 & grades 3 and 4 (The genes of interest were in Grade 4-for Glioblastoma). These genes were then analysed using reactome, which is a web-based application and is essential for Pathway Analysis.

Further analysis on the protein-protein interaction can be done to understand the underlying structure of the genes and what effects the body would have upon the suppression of some of the proteins.

Use Reactome.org:  https://reactome.org/PathwayBrowser/#/DTAB=AN

Click on Analysis on the top panel (https://reactome.org/PathwayBrowser/#/DTAB=AN&TOOL=AT)

In the space given, you can either choose a file that contains the names of the genes or enter them manually in the textbar provided. Then click on continue

The 'Project to Human' checkbox is checked by default. This is suggested as all of the genes that are functional in the human system will be projected.

Clicking on analyse gives a map of all the functionalities with the names of the proteins associated with all of the total genes in the human system. So, based on the genes entered, the map highlights only the segments of the pathway that is associated with the genes. 
FOR INSTANCE: The genes that were of interest to me were ASCL5 and NOG. The whole map looks grey except for a very small segment on signal transduction(mustard yellow-can be changed using the colour palette on the right side of the page where the color bar is present. Choosing Barium Lithium gives a clearer view as it makes all the other pathways translucent), and it displays the three pathways associated with it. 

Run the r script (dif_gene.r)
This creates 3 different files with lists of the differentially expressed genes between grades 2 and 3; 3 and 4; and 2 and 4.
These 3 files created are in .txt format. I did try to change the format in the scipt to scv instead of txt. But the data is all coagulated and not exactly seperated. They can be opened in Excel (Numbers if you're on MacOS and GNumeric on Linux or any other spreadsheet softwares) and converted to csv.
The result of what should be obtained in the results folder (Both csv and txt are present in the folder here). The genes present in these files in results can be chosen or arranged or used for any further analysis.
