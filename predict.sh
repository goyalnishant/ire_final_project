#!/bin/bash
if [ $1 == "ngram" ] ;
then
python ngram.py $2 $3 "${@:4}"

elif [ $1 == "lstm" ];
then
python lstm.py $2 $3 "${@:4}"
fi;