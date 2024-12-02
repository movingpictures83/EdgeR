
library(edgeR)
input <- function(inputfile) {
   cnts <<- readRDS(inputfile)
}

run <- function() {}

output <- function(outputfile) {


	grp.idx <- rep(c("knockdown", "control"), each=4)
dgel <- DGEList(counts=cnts, group=factor(grp.idx))
dgel <- calcNormFactors(dgel)
dgel <- estimateCommonDisp(dgel)
dgel <- estimateTagwiseDisp(dgel)
et <- exactTest(dgel)
edger.fc=et$table$logFC
names(edger.fc)=rownames(et$table)
exp.fc=edger.fc
out.suffix="edger"
}
