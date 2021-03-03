# STR variant calling
GangSTR (variant calling), dumpSTR (variant filtering), and mergeSTR (VCF merging and statistics) for 16p12 cohort.

### gangstr_by_family.sh

GangSTR variant calling for 16p12 deletion cohort (except family PSU008).

### gangstr_by_family_PSU008.sh

GangSTR variant calling for family PSU008.

### dumpstr_by_family.sh

Filters gangSTR variant calls with --min-call-DP 20	--max-call-DP 1000	--filter-spanbound-only	--filter-badCI	--readlen 150

Note: these are the same parameters as Gymrek's paper (excluding --require-support 2 which results in empty VCF)

--require-support 2 uses the AD field, which gangSTR doesn't output.

see https://www.nature.com/articles/s41586-020-03078-7#Sec6

### mergestr_by_family.sh

Merges VCFs output by dumpstr_by_family.sh using default MergeSTR parameters.

