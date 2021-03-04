#!/bin/bash
#SBATCH --account=girirajan
#SBATCH --partition=girirajan
#SBATCH --job-name=dumpstr
#SBATCH -o logs/mergestr_by_family/dumpstr2.log
#SBATCH -e logs/mergestr_by_family/dumpstr2.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=400:0:0
#SBATCH --mem-per-cpu=2G
#SBATCH --chdir /data5/16p12_WGS/structural_variants/vcf_callers
#SBATCH --nodelist=durga

# from https://www.nature.com/articles/s41586-020-03078-7#Sec6:
# The merged VCF was then used as input to dumpSTR to compute locus-level filters using the parameters --min-locus-hwep 10−5 --min-locus-callrate 0.8 --filter-regions GRCh38GenomicSuperDup.sorted.gz --filter-regions-names SEGDUP to remove genotypes overlapping segmental duplications


export SINGULARITY_CACHEDIR=/data5/16p12_WGS/structural_variants/vcf_callers/durga_cache


vcf=output/mergestr_by_family/mergestr.vcf


singularity exec \
	-B /data5 \
	durga_cache/str-toolkit.simg \
	dumpSTR \
	--vcf $vcf \
	--out output/mergestr_by_family/mergestr_filtered
	--min-locus-hwep 10−5 \
	--min-locus-callrate 0.8 \
	--filter-regions GRCh37GenomicSuperDup.sorted.gz \
	--filter-regions-names SEGDUP

# Note: GRCh37GenomicSuperDup.sorted.gz was obtained from UCSC Table Browser
# with the options: Mammal, HUman, GRCh37/hg19, Repeats, Segemntal Dups, genomicSuperDups
# https://genome.ucsc.edu/cgi-bin/hgTables?hgsid=1047622799_NYRO2yV9XWpcQdLYnWOEDqBIAVUJ&clade=mammal&org=&db=hg19&hgta_group=rep&hgta_track=genomicSuperDups&hgta_table=genomicSuperDups&hgta_regionType=genome&position=&hgta_outputType=primaryTable&hgta_outFileName=



