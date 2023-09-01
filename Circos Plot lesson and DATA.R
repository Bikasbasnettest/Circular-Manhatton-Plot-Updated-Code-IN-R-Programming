Circ<-read.csv("C:/Users/HP/OneDrive/Desktop/CDD.csv",
               header = TRUE,row.names =1 )
print(Circ)
str(Circ)
require(circlize)
Circ <- as.matrix(Circ)
chordDiagram(Circ)
#This code clear the Data lebel of the Outer circos diagramm.
chordDiagram(Circ, annotationTrack = "grid", preAllocateTracks = 1)
#add the labels and axis
circos.trackPlotRegion(track.index = 2, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
#print labels 
circos.text(mean(xlim), ylim[1] + 2.5, sector.name, 
              facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5),
              cex=0.6)
circos.axis(h = "top", labels.cex = 0.5, major.tick.percentage = 0.2, 
            sector.index = sector.name, track.index = 2)
}, bg.border = NA)

