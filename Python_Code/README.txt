Steps for running microarray.py

1. Enter iPython in your terminal using the command “ipython”. If iPython is not already installed, use the command “pip install ipython” to download.

2. Other dependencies are also required, including pandas and numpy. Each of these can be installed using “pip install numpy” and “pip install pandas” respectively. The numpy package is useful for performing large computations, and pandas is allows for storage of large data frames and data series in Python.

3. From the iPython console, enter: “import microarray”.

4. You can now execute any of the functions in the microarray.py file from the command line. The main function for mapping probes to the genome is called “mapProbes2Genome”.

5. In order to run, the probe annotation files and a GFF file must be present in the current directory. Check that they are there!

6. From the command line, enter:

microarray.mapProbes2Genome(gff_file)

Where in place of gff_file you provide the name of the GFF annotation file. The one I have provided is called “combined.fix.gff.csv”.

7. By default, the program will run the mappings for over the entire gene body. However, if you would like to do analysis over another region relative to the gene body, you can do so using the optional “downstream_dist" parameter. For instance:

microarray.mapProbes2Genome(combined.fix.gff.csv, downstream_dist=100)

will perform probe to gene mappings for the region from 0-100 of the transcription stop site for each gene.

If you wish to do the analysis for a region not relative to the transcription stop site, you can play around with the code a little bit, particularly the function mapProbes2DownstreamRegions, lines 143 and 145, which specify the selection criteria  for probes.



DEBUGGING

If you encounter any issues running the script, here are some common places that cause errors:

COLUMN NAMES - check that the column names for the GFF and chromosome probe files match what they are in the files I provided.

FILE NAMES - probe files need to use alpha numerical numbering, not roman numerals, for the chromosomes; also, plus and minus strand should be specified with “+” and “-“ rather than “p” and “m”.

Contact Alex Lederer, at alexlederer19@gmail.com, with further inquiries.
