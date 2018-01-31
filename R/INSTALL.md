R
=

```
R RPMS for Fedora, Red Hat Enterprise Linux and Derivatives
===========================================================
Martyn Plummer
2014-07-22

Contents
1) Fedora
2) EPEL for Red Hat Enterprise Linux and Others
3) RPMS for R Packages
4) Creating your own R package RPMS

1) Fedora
=========

R packages for Fedora Linux are maintained and distributed by Red Hat
Software. Fedora users can install R with yum from the standard Fedora
repository using

sudo yum install R

The RPM 'R' is a meta package. It has no content but ensures that the
following components are installed

R-core	       User RPM
R-core-devel   Developer RPM containing header files
R-java	       RPM to ensure that R is configured for use with Java
libRmath       Standalone R math library
libRmath-devel Header file for the standalone R math library

It is standard practice to divide RPMs into "user" and "developer"
versions. In the case of R on Fedora, these are provided by the
'R-core' and 'R-core-devel' RPMs. However, almost all R users on
Fedora will need 'R-core-devel' in order to install R packages from
source. Therefore it is recommended to install the meta-package 'R'.

2) Red Hat Enterprise Linux (RHEL)
   CentOS
   Scientific Linux
   Oracle Linux
==================================

The Fedora RPMs for R have been ported to RHEL by the project Extra
Packages for Enterprise Linux (EPEL).

http://fedoraproject.org/wiki/EPEL 

These RPMs are also compatible with distributions derived from RHEL.

To use the EPEL repository, it is sufficient to download and install
the appropriate "epel-release" RPM, as described in the EPEL FAQ:

https://fedoraproject.org/wiki/EPEL/FAQ#How_can_I_install_the_packages_from_the_EPEL_software_repository.3F

Then R can be installed as described above in the section on Fedora.

3) R packages
=============

Fedora provies a selection of R packages as RPMs. A more limited
selection of these packages has been ported to EPEL. The RPM name is
derived from the R package name by adding the prefix "R-". Hence all
R-related RPMS can be listed with the yum command

yum list R-\*

The listing below shows all RPMS available for R packages on Fedora
20, classified by the R repository that would normally be used to
install the package from within R (See the help page ?chooseRepositories).

$CRAN
 [1] "R-abind"      "R-acepack"    "R-biglm"      "R-bigmemory"  "R-bitops"    
 [6] "R-car"        "R-caTools"    "R-combinat"   "R-DBI"        "R-lmtest"    
[11] "R-mAr"        "R-msm"        "R-multcomp"   "R-mvtnorm"    "R-nws"       
[16] "R-pls"        "R-qcc"        "R-qtl"        "R-RCurl"      "R-rlecuyer"  
[21] "R-RM2"        "R-RODBC"      "R-RSQLite"    "R-RUnit"      "R-sandwich"  
[26] "R-sciplot"    "R-statmod"    "R-systemfit"  "R-timeDate"   "R-waveslim"  
[31] "R-wavethresh" "R-XML"        "R-xtable"     "R-zoo"       

$`BioC software`
 [1] "R-affy"                  "R-affyio"               
 [3] "R-AnnotationDbi"         "R-Biobase"              
 [5] "R-BiocGenerics"          "R-biomaRt"              
 [7] "R-Biostrings"            "R-BSgenome"             
 [9] "R-BufferedMatrix"        "R-BufferedMatrixMethods"
[11] "R-DynDoc"                "R-GenomicFeatures"      
[13] "R-GenomicRanges"         "R-IRanges"              
[15] "R-maanova"               "R-multtest"             
[17] "R-preprocessCore"        "R-qvalue"               
[19] "R-ROC"                   "R-Rsamtools"            
[21] "R-rtracklayer"           "R-tkWidgets"            
[23] "R-widgetTools"          

$`BioC annotation`
[1] "R-hgu133acdf"    "R-hgu95av2cdf"   "R-hgu95av2probe"

$`BioC experiment`
[1] "R-affydata"  "R-ALL"       "R-fibroEset"

$`BioC extra`
[1] "R-RCurl"

$Omegahat
[1] "R-Rcompression" "R-RCurl"        "R-XML"         

$`R-Forge`
[1] "R-abind"     "R-bigmemory" "R-car"       "R-msm"       "R-multcomp" 
[6] "R-mvtnorm"   "R-timeDate"  "R-waveslim"  "R-xtable"   

$Other
[1] "R-GeneR"      "R-RScaLAPACK" "R-Rsolid"     "R-hdf5"      

Note that the classification is not mutually exclusive (e.g. R-RCurl
appears several times) and that Fedora provides RPMs that are not
available from any standard R repository. These are listed under
"Other".

The above listing is created by the following utility function, which
may be freely used, redistributed and modified without restriction.

classify.rpms <- function()
{
    ## Get a list of R packages available via yum
    pkg <- system("yum list -q R-\\*", intern=TRUE)
    pkg <- sub(pattern="\\..+$", replacement="", pkg)
    pkg <- pkg[grep("-devel$", pkg, invert=TRUE)] #no devel packages
    pkg <- pkg[grep("-debuginfo$", pkg, invert=TRUE)] #no debug packages
    pkg <- setdiff(pkg, c("R", "R-core", "R-java",
                          "Installed Packages",
                          "Available Packages"))
    pkg <- unique(pkg)

    ## Get the database of standard repositories
    p <- file.path(R.home("etc"), "repositories")
    reps <- read.table(p, header=TRUE, sep="\t")
    out <- vector("list", nrow(reps))
    names(out) <- reps$menu_name
    for (i in seq_along(out)) {
        ## Match repositories to available yum packages
        setRepositories(ind=i)
        av <- paste("R", available.packages()[,"Package"], sep="-")
        out[[i]] <- intersect(av, pkg)
    }
    setRepositories(ind=1) #Set default repository to CRAN
    out$Other <- setdiff(pkg, unlist(out)) #unclassified packages
    out[sapply(out, length) > 0] #remove empty categories
}

4) Creating your own R package RPMs
===================================

Both Fedora and EPEL provide the R2spec package, which may be used
to create your own R package RPMs. See https://fedorahosted.org/r2spec/
```

```

```





#### Ubuntu 16.04
```sh
$sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

$sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

$sudo apt-get update

$sudo apt-get install r-base
```

