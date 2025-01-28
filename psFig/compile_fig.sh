#!/bin/bash

file_name=$1
echo "Compile psTricks file $file_name ..."

latex $file_name.tex
dvips $file_name.dvi
ps2pdf -dALLOWPSTRANSPARENCY $file_name.ps

rm -rf *.aux *.dvi *.log *.ps
