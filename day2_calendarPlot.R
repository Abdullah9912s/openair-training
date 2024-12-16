


png("Riyadh.png",width = 4*300, height = 5*300, res=100)
calendarPlot(sat,pollutant="eBC",year=2016,statistics="mean",main="SRN2016 [eBC]",par.settings=list(fontsize=list(text=28)))
dev.off()
quit()
