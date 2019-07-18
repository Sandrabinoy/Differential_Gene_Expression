#Using the library pheatmap
library(pheatmap())
df <- read.table("The_Differentially_Expressed_Genes_Between_Grade3_and_Grade4.txt")
df
pheatmap(df, cutree_rows = 4)


#Using the library d3heatmap
library("d3heatmap")
d3heatmap(scale(df), colors = "RdYlBu",
          k_row = 4, # Number of groups in rows
          k_col = 2 # Number of groups in columns
)
#Change colours


#Using the library dendextend (for dendograms)
library(dendextend)
# order for rows
Rowv  <- df %>% scale %>% dist %>% hclust %>% as.dendrogram %>%
  set("branches_k_color", k = 3) %>% set("branches_lwd", 1.2) %>%
  ladderize
# Order for columns: We must transpose the data
Colv  <- df %>% scale %>% t %>% dist %>% hclust %>% as.dendrogram %>%
  set("branches_k_color", k = 2, value = c("orange", "blue")) %>%
  set("branches_lwd", 1.2) %>%
  ladderize
d2 <- dist(df)
d3 <- hclust(d2, method = "average")
dend <- as.dendrogram(d3)
as.dendrogram
dend %>% plot  ##Plots the graph
dend %>% labels ##Prints the labels
par(mfrow = c(1,1))
dend %>% set("labels_cex", 0.5) %>% plot(main = "Change label's size") #changes size of the labels 

