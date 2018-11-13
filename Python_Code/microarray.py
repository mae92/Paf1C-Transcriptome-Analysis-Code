""" 
MICROARRAY.py performs probe to gene mappings using provided probe and genome annotation files.
Script created by Alex Lederer, alexlederer19@gmail.com
"""

import math
import pandas as pd
import numpy as np
from pandas import DataFrame, Series
import os
import os.path

def mkpath(path):
    """ Make path specified, if it does not already exist. """
    if not os.path.exists(path):
        os.makedirs(path)

def manipulate_gff(gff_file, save_as):
	""" 
	Extracts short gene feature name from longer gff identifier and writes output to new file. 
	:param gff_file: S cerevisiae gff file
	:param save_as: File name to save output to
	"""
	gff_df = pd.read_csv(gff_file)
	gff_df["name"] = Series()
	print len(gff_df)	
	for i in range(0, len(gff_df)):
		identifier = gff_df.loc[i, 'identifier']
		if  type(identifier) is not float:
			d = dict(item.split("=") for item in identifier.split(";"))
		if "ID" in d:
			gff_df.loc[i, 'name'] = d["ID"]
			split_id = d["ID"].split("_")
			gff_df.loc[i, 'systematic_name'] = split_id[0]
		elif "Name" in d:
			gff_df.loc[i, 'name'] = d["Name"]
			split_id = d["Name"].split("_")
			gff_df.loc[i, 'systematic_name'] = split_id[0]
		else:
			print d
		if "gene" in d:
			gff_df.loc[i, 'gene'] = d["gene"]
		if i % 1000 == 0:
			print i
	gff_df.to_csv(save_as)

def mapProbes2Genes(probe_file, gff_file, chrom, strand, save_as):
	"""
	Maps microarray probe reads to affiliated genes using gff file and produces output file.
	:param probe_file: Input file containing probe signal reads
	:param gff_file: S cerevisiae gff gene feature file
	:param save_as: File name to save output to
	"""
	probe_df = pd.read_csv(probe_file)
	gff_df = pd.read_csv(gff_file)#, sep = '\t')
	print len(gff_df)
	for i in range(0, len(gff_df)):  # for each row in gff file
		row = gff_df.iloc[i]  # isolate row
		if (row.chr == chrom) and (row.strand == strand):  # if row matches chrom and strand
			subset = probe_df[probe_df.position.isin(range(int(row.start), int(row.stop)))]
			means = subset.mean()
			row_names = means.index
			for name in row_names:
				gff_df.ix[i, name] = means[name]
		
		if i % 1000 == 0:
			print i

	gff_df_v2 = gff_df[np.isfinite(gff_df['position'])]
	gff_df_v2.to_csv(save_as)

def mapProbes2Genome(gff_file, downstream_dist = 0, opt = ""):
	chromosomes = ["chrI", "chrII", "chrIII", "chrIV", "chrV", "chrVI", "chrVII", "chrVIII", "chrIX", "chrX", "chrXI", "chrXII", "chrXIII", "chrXIV", "chrXV", "chrXVI", "chrmt"]
	#chromosomes = ["chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chrmt"]
	strand = ["+", "-"]
	#strand = ['p', 'm']
	#new_dir = str(downstream_dist-50)+"-"+str(downstream_dist)
	#mkpath(new_dir)

	for i in range(1, 18):
		print "i = " + str(i)
		for st in strand:
			chrom = chromosomes[i-1]
			print chrom + st
			if i == 17:
				i = "mt"
			probe_file = str(i) + "." + st + ".csv"
			save_as = str(i) + "." + st + ".mapped" + opt + ".csv"
			if downstream_dist == 0:
				mapProbes2Genes(probe_file, gff_file, chrom, st, save_as)
			else:
				new_dir = str(downstream_dist-50)+"-"+str(downstream_dist)
				mkpath(new_dir)
				mapProbes2DownstreamRegions(probe_file, gff_file, chrom, st, new_dir+"/"+save_as, downstream_dist)
			if i == "mt":
				i = 17

def occupancy_mapProbes2Genes(probe_file, gff_file, chrom, save_as, csv = False):
	"""
	Maps microarray probe reads to affiliated genes using gff file and produces output file.
	:param probe_file: Input file containing probe signal reads
	:param gff_file: S cerevisiae gff gene feature file
	:param save_as: File name to save output to
	"""
	probe_df = pd.read_csv(probe_file)
	gff_df = pd.read_csv(gff_file)
	print len(gff_df)
	for i in range(0, len(gff_df)):  # for each row in gff file
		row = gff_df.iloc[i]  # isolate row
		if (row.chr == chrom):
			subset = probe_df[probe_df.end.isin(range(int(row.start), int(row.stop)))]
			means = subset.mean()
			row_names = means.index
			for name in row_names:
				gff_df.ix[i, name] = means[name]
		
		if i % 1000 == 0:
			print i

	gff_df_v2 = gff_df[np.isfinite(gff_df['end'])]
	gff_df_v2.to_csv(save_as)

def occupancy_mapProbes2Genome(gff_file, downstream_dist = 0, opt = "", csv = False):
	#chromosomes = ["chrI", "chrII", "chrIII", "chrIV", "chrV", "chrVI", "chrVII", "chrVIII", "chrIX", "chrX", "chrXI", "chrXII", "chrXIII", "chrXIV", "chrXV", "chrXVI", "chrmt"]
	chromosomes = ["chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chrmt"]

	for i in range(1, 17): #18):
		print "i = " + str(i)
		chrom = chromosomes[i-1]
		print chrom
		#if i == 17:
		#	i = "mt"
		probe_file = str(i) + ".csv"
		save_as = str(i) + ".mapped" + opt + ".csv"
		occupancy_mapProbes2Genes(probe_file, gff_file, chrom, save_as)
		#if i == "mt":
		#	i = 17


def mapProbes2DownstreamRegions(probe_file, gff_file, chrom, strand, save_as, dist):
	probe_df = pd.read_csv(probe_file)
	gff_df = pd.read_csv(gff_file)
	#temp = True
	for i in range(0, len(gff_df)):
		row = gff_df.iloc[i]
		if (row.chr == chrom) and (row.strand == strand):
			if strand == "+":
				subset = probe_df[probe_df.position.isin(range(int(row.stop), int(row.stop+dist)))]
			else: # strand == "-":
				if int(row.start-dist) <= 0:
					subset = probe_df[probe_df.position.isin(range(int(0), int(row.start-dist)))]
				else:
					subset = probe_df[probe_df.position.isin(range(int(row.start-dist), int(row.start)))]
			means = subset.mean()
			row_names = means.index
			for name in row_names:
				gff_df.ix[i, name] = means[name]
		'''elif (row.chromosome != chrom):
			if (temp):
				temp = False
			elif (not temp):
				break;'''
		
		if i % 1000 == 0:
			print i

	gff_df_v2 = gff_df[np.isfinite(gff_df['position'])]
	gff_df_v2.to_csv(save_as)
