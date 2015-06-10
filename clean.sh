#!/bin/sh

echo "####################################################################################################"
echo "##### Cleaning build files"
echo "####################################################################################################"



rm -rf build-en
rm -rf build-pt
mkdir build-en
mkdir build-pt

ln -s "`pwd`/references.bib" "`pwd`/build-en/references.bib"
ln -s "`pwd`/references.bib" "`pwd`/build-pt/references.bib"

ln -s "`pwd`/unsrt-pt.bst" "`pwd`/build-en/unsrt-pt.bst"
ln -s "`pwd`/unsrt-pt.bst" "`pwd`/build-pt/unsrt-pt.bst"



echo "\n\n"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"
echo ">>>>> Finished"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"

