import pandas as pd

anno = pd.read_csv('output/16p12_cohort.expansions_2SD.hg19_multianno.txt', sep='\t')
anno['variant_id'] = anno['Chr'] + '_' + anno['Start'].astype(str) + '_' + anno['Alt']
anno = anno.set_index('variant_id')


df = pd.read_csv('output/16p12_cohort.expansions_2SD.tsv', sep='\t')
df['variant_id'] = df['chrom'] + '_' + df['pos'].astype(str) + '_' + df['alt_allele']
df = df.set_index('variant_id')


# filter out intergenic variants
# anno = anno[anno['Func.refGene'] != 'intergenic'].copy()
# df = df.loc[anno.index].copy()

cols = ['chrom', 'pos', 'end', 'sample', 'zscore',
       'longest_allele', 'cohort_mode', 'motif_period']
# drop ref allele and alt allele
df = df[cols].copy()


anno_cols = anno.columns[5:]
for i in df.index:
	for col in anno_cols:
		df.loc[i, col] = anno.loc[i, col]


df.to_csv('output/16p12_cohort.expansions_2SD.annotated.tsv', sep='\t', index=False)

