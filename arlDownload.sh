for n in {2015..2010}; do for m in {01..12}; do wget ftp://arlftp.arlhq.noaa.gov/pub/archives/reanalysis/RP${n}${m}.gbl; done; done

#for high resolution.
for n in 2017; do for m in 10;do for d in {01..31}; do wget ftp://arlftp.arlhq.noaa.gov/pub/archives/gdas0p5/2017${m}${d}_gdas0p5;done; done; done
