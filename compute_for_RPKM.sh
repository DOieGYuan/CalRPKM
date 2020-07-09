# usage: ./compute_for_RPKM.sh [bowtie2db_prefix] [length file] [threads]
# For example ./compute_for_RPKM.sh BacMet BacMet_length.txt 12
for f in *_1.fq.gz; do bowtie2 -1 $f -2 ${f%_1.fq.gz}_2.fq.gz --no-discordant --no-mixed -p $3 --fast -S ${f%_1.fq.gz}_mapping.tmp.sam -a -x $1 --no-head --no-sq; sed '1~2d' ${f%_1.fq.gz}_mapping.tmp.sam | cut -f1,3,4,5,8 | grep -v '*' > ${f%_1.fq.gz}.abr.drs; ./procSam.pl ${f%_1.fq.gz}.abr.drs $2 > ${f%_1.fq.gz}.all.csv ; rm ${f%_1.fq.gz}_mapping.tmp.sam; done
