
suppressMessages(library(optparse))
suppressMessages(library(data.table))
suppressMessages(library(locuscomparer))
suppressMessages(library(coloc))

option_list <- list(
    optparse::make_option(c("--eqtl"), type="character", default= "/COLOC/extdata/Lepik_2017_ge_blood_chr1_ENSG00000130940.all.tsv",help="eQTL summary stats for one region"),
    optparse::make_option(c("--gwas"), type="character", default="/COLOC/extdata/I9_VARICVE_chr1.tsv", help="GWAS summary stats for 1 region") ,
    optparse::make_option(c("--out"), type="character", default="/COLOC/out.txt", help="outputfile"), 
    optparse::make_option(c("--header_eqtl"), type="character", default="", help="Header of the eQTL file, separeted by comme"),
    optparse::make_option(c("--header_gwas"), type="character", default="", help="Header of the GWAS file, separeted by comma"),
)

opt <- optparse::parse_args(optparse::OptionParser(option_list=option_list))

header_eqtl <- strsplit(opt$header_eqtl, ",") %>% unlist()
header_gwas <- strsplit(opt$header_gwas, ",") %>% unlist()

run_coloc(eqtl_data = opt$eqtl, gwas_data = opt$gwas, out = opt$out)