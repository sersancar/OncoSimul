#!/bin/bash

## This places the code to upload to BiC in the right place.
## The Subversion-in-BioC-3.2 directory is a special directory (under svn vc)
## for the code in BioC. Yes, will eventually use
## the bridge or similar.

## If passed an additional argument, with the path of an R version, it
## builds and tests.

## Yes, works under eshell.

cp OncoSimulR/vignettes/OncoSimulR.Rnw ./Subversion-in-BioC-3.2/OncoSimulR/vignettes/.
cp OncoSimulR/vignettes/OncoSimulR.bib ./Subversion-in-BioC-3.2/OncoSimulR/vignettes/.
cp OncoSimulR/vignettes/gitsetinfo.sty ./Subversion-in-BioC-3.2/OncoSimulR/vignettes/.
cp OncoSimulR/vignettes/gitinfo.sty ./Subversion-in-BioC-3.2/OncoSimulR/vignettes/.
cp OncoSimulR/vignettes/gitHeadInfo.gin ./Subversion-in-BioC-3.2/OncoSimulR/vignettes/.

cp OncoSimulR/src/*.c ./Subversion-in-BioC-3.2/OncoSimulR/src/.
cp OncoSimulR/src/*.cpp ./Subversion-in-BioC-3.2/OncoSimulR/src/.
cp OncoSimulR/src/*.h ./Subversion-in-BioC-3.2/OncoSimulR/src/.
cp OncoSimulR/src/Makevars* ./Subversion-in-BioC-3.2/OncoSimulR/src/.

cp OncoSimulR/R/*.R ./Subversion-in-BioC-3.2/OncoSimulR/R/.

cp OncoSimulR/tests/testthat/*.R ./Subversion-in-BioC-3.2/OncoSimulR/tests/testthat/.
cp OncoSimulR/tests/manual/*.R ./Subversion-in-BioC-3.2/OncoSimulR/tests/manual/.
cp OncoSimulR/tests/manual/*.txt ./Subversion-in-BioC-3.2/OncoSimulR/tests/manual/.


cp OncoSimulR/man/*.Rd ./Subversion-in-BioC-3.2/OncoSimulR/man/.

cp OncoSimulR/inst/NEWS ./Subversion-in-BioC-3.2/OncoSimulR/inst/.
cp OncoSimulR/inst/CITATION ./Subversion-in-BioC-3.2/OncoSimulR/inst/.
cp OncoSimulR/inst/miscell/example-binom-problems.cpp ./Subversion-in-BioC-3.2/OncoSimulR/inst/miscell/.

cp OncoSimulR/data/*.RData ./Subversion-in-BioC-3.2/OncoSimulR/data/.

cp OncoSimulR/NAMESPACE ./Subversion-in-BioC-3.2/OncoSimulR/.

cp OncoSimulR/DESCRIPTION ./Subversion-in-BioC-3.2/OncoSimulR/.


## should we run the tests?

if [[ $# == 1 ]]; then
    V_R=$1
    cd ~/Proyectos/OncoSimul/Subversion-in-BioC-3.2
    V_P=$(cat ./OncoSimulR/DESCRIPTION | grep Version | cut -d' ' -f2)
    rm OncoSimulR_$V_P.tar.gz
    ## As shown in build report from BioC
    # echo " ***************************************** "
    # echo " *********  R CMD build   ************** "
    # echo " "
    # time $V_R CMD build --keep-empty-dirs --no-resave-data OncoSimulR
    # echo " "
    # echo " ===========  done R CMD build  ========== "
    # echo " "
    # ## As shown in check report from BioC
    # echo " *************************************************** "
    # echo " **** R CMD check , as in check report **** "
    # echo ""
    # time $V_R CMD check --no-vignettes --timings OncoSimulR_$V_P.tar.gz
    # echo " "
    # echo " =========   done R CMD check as in check report  =======  "
    # echo " "
    ## time as explained in https://www.bioconductor.org/developers/package-guidelines/#correctness
    # echo " ************************************ "
    # echo " *****   R CMD check: time OK?  ***** "
    # echo ""
    # time $V_R CMD check --no-build-vignettes OncoSimulR_$V_P.tar.gz
    # echo " "
    # echo " ===========  done R CMD check time OK?   ========== "
    ## As shown in build report from BioC
    echo " ***************************************** "
    echo " *********  R CMD build vanilla  ************** "
    echo " "
    time $V_R --vanilla CMD build --keep-empty-dirs --no-resave-data OncoSimulR
    echo " "
    echo " ===========  done R CMD build   vanilla ========== "
    echo " "
    ## As shown in check report from BioC
    echo " *************************************************** "
    echo " **** R CMD check vanilla , as in check report **** "
    echo ""
    time $V_R --vanilla CMD check --no-vignettes --timings OncoSimulR_$V_P.tar.gz
    echo " "
    echo " =========   done R CMD check vanilla as in check report  =======  "
    echo " "
    ## time as explained in https://www.bioconductor.org/developers/package-guidelines/#correctness
    echo " ************************************ "
    echo " *****   R CMD check: time OK?  ***** "
    echo ""
    time $V_R --vanilla CMD check --no-build-vignettes OncoSimulR_$V_P.tar.gz
    echo " "
    echo " ===========  done R CMD check vanilla time OK?   ========== "

    
fi


## Check what/if things need adding
cd ~/Proyectos/OncoSimul/Subversion-in-BioC-3.2/OncoSimulR

svn status --show-updates

