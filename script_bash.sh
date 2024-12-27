#!/bin/bash

function copiarFile(){
	cp -v "$1/$2" $3
}

function copy(){
	
	# $1= origem
	# $2= destino
	# cp - copia da origem $1 para o destino $destino
	for i in $( ls $1 ); do
		pasta="$2/${i##*.}"
		if [ -e $pasta  ]; then
			copiarFile $1 $i $pasta
		else
			cd $2
			mkdir ${i##*.}
			cd ..
			copiarFile $1 $i $pasta
		fi
	done;
	
}

if [ -e $1 ] && [ -e $2 ]; then
	copy $1 $2
else
	mkdir $2
	copy $1 $2
fi
