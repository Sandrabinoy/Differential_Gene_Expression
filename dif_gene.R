dat00<-read.table("CGGA_Gene_Expression_Profile_FPKM.txt",head=T,row.names = 1)
dat00[1:6,1:4]
dat0<-log2(dat00+0.001)
dat0[1:6,1:4]
pheno0<-read.table("Patient_Characteristics.txt",head=T,sep="\t")
pheno0[1:4,1:5]
grade<-as.numeric(pheno0[,'Grade'])

##To identify differentially expressed genes between grade 2 and grade 3
index2<-which(grade==2)
index3<-which(grade==3)
dat23<-dat0[,c(index2,index3)]
t23<-apply(dat23,1,function(x){
  mod<-t.test(x[index2],x[index3])
  meanx<-mean(2^x[index2]-0.001)
  meany<-mean(2^x[index3]-0.001)
  tvalue<-mod[1]$statistic[[1]]
  fd<-meany/meanx
  pvalue<-mod[3]$p.value
  c(meanx=meanx,meany=meany,tvalue=tvalue,fd=fd,pvalue=pvalue)
})
t23<-t(t23)
t23[1:10,1:5]
adjp<-p.adjust(t23[,'pvalue'],method="BH")
rs23<-cbind(t23,adjp)
rs23[1:10,1:6]
final23<-rs23[((rs23[,'fd']>=2|rs23[,'fd']<=1/2)&rs23[,'adjp']<0.05&rs23[,'pvalue']<0.05),]
final23[1:10,1:6]
length(which(final23[,'fd']>=2))
length(which(final23[,'fd']<=1/2))
write.table(final23,"The_Differentially_Expressed_Genes_Between_Grade2_and_Grade3.txt",quote=F,sep="\t")

##To identify differentially expressed genes between grade 2 and grade 4
index4<-which(grade==4)
dat24<-dat0[,c(index2,index4)]
t24<-apply(dat24,1,function(x){
  mod<-t.test(x[index2],x[index4])
  meanx<-mean(2^x[index2]-0.001)
  meany<-mean(2^x[index3]-0.001)
  tvalue<-mod[1]$statistic[[1]]
  fd<-meany/meanx
  pvalue<-mod[3]$p.value
  c(meanx=meanx,meany=meany,tvalue=tvalue,fd=fd,pvalue=pvalue)
})
t24<-t(t24)
t24[1:10,1:5]
adjp<-p.adjust(t24[,'pvalue'],method="BH")
rs24<-cbind(t24,adjp)
rs24[1:10,1:6]
final24<-rs24[((rs24[,'fd']>=2|rs24[,'fd']<=1/2)&rs24[,'adjp']<0.05&rs24[,'pvalue']<0.05),]
final24[1:10,1:6]
length(which(final24[,'fd']>=2))
length(which(final24[,'fd']<=1/2))
write.table(final24,"The_Differentially_Expressed_Genes_Between_Grade2_and_Grade4.txt",quote=F,sep="\t")

##To identify differentially expressed genes between grade 3 and grade 4
dat34<-dat0[,c(index3,index4)]
t34<-apply(dat34,1,function(x){
  mod<-t.test(x[index3],x[index4])
  meanx<-mean(2^x[index2]-0.001)
  meany<-mean(2^x[index3]-0.001)
  tvalue<-mod[1]$statistic[[1]]
  fd<-meany/meanx
  pvalue<-mod[3]$p.value
  c(meanx=meanx,meany=meany,tvalue=tvalue,fd=fd,pvalue=pvalue)
})
t34<-t(t34)
t34[1:10,1:5]
adjp<-p.adjust(t34[,'pvalue'],method="BH")
rs34<-cbind(t34,adjp)
rs34[1:10,1:6]
final34<-rs34[((rs34[,'fd']>=2|rs34[,'fd']<=1/2)&rs34[,'adjp']<0.05&rs34[,'pvalue']<0.05),]
final34[1:10,1:6]
length(which(final34[,'fd']>=2))
length(which(final34[,'fd']<=1/2))
write.table(final34,"The_Differentially_Expressed_Genes_Between_Grade3_and_Grade4.txt",quote=F,sep="\t")

##To obtain the differentially expressed gene profile 
gene_list<-unique(c(rownames(final23),rownames(final34),rownames(final24)))
length(gene_list)
DEGExpr<-dat0[gene_list,]
DEGExpr[1:4,1:4]
write.table(DEGExpr,"DEGExpr.txt",sep="\t",quote=F)