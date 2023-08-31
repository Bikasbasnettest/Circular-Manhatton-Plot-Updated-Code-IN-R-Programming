setwd("E:/Circular manhatton Plot code")
Bindas<-read.csv("E:/Circular manhatton Plot code/second  data of manhatton circ.csv",header = TRUE)
head(Bindas)
attach(Bindas)

print(Bindas)
tail(Bindas)
library(CMplot)

#seccond type of this code for the CM plot
CMplot(Bindas,
       type = "p",
       plot.type = "c",
       chr.labels = c("Chromosome 1", "Chromosome 2", "Chromosome 3", "Chromosome 4", 
                      "Chromosome 5", "Chromosome 6", "Chromosome 7", "Chromosome 8"),
       r = 0.8,
       cir.axis = TRUE,
       outward = FALSE,
       cir.axis.col = "black",
       cir.chr.h = 1.5,
       chr.den.col = c("black", "green", "pink", "darkgreen", "yellow", "red"),
       file = "jpg",
       file.name = "Circular_manhattan_plot",
       dpi = 400,
       file.output = TRUE,
       verbose = TRUE,
       width = 15,
       height = 15,
       threshold = c(1e-3, 1e-2),
       amplify = TRUE,
       threshold.lty = c(1, 2),
       threshold.col = c("red", "blue"),
       signal.line = 1,
       signal.col = c("red", "green"))





