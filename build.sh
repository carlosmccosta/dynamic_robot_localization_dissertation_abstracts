#!/bin/sh


echo "####################################################################################################"
echo "##### Making abstracts"
echo "####################################################################################################"


compile() {
	echo "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Compiling $2.tex"
	echo "------------------------------------------------"
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$1 $2.tex
}


bibliography() {
	echo "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Building bibliography with bibtex for $2"
	echo "------------------------------------------------"
	sh -c "cd $1 && bibtex $2.aux"
}


glossaries() {
	echo "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Making glossaries for $2"
	echo "------------------------------------------------"
	sh -c "cd $1 && makeglossaries $2"
}



if [ ! -d "build-en" ]; then
  ./clean.sh
fi


buildChain() {
	compile $1 $2
	bibliography $1 $2
	glossaries $1 $2
	compile $1 $2
	glossaries $1 $2
	compile $1 $2
	compile $1 $2
}


buildChain build-en summary
buildChain build-pt resumo



echo "\n\n"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"
echo ">>>>> Finished"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"
