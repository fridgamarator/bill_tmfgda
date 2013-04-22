#!/bin/bash
FILES=javascripts/*
echo "removing files in ~/serveexport"
rm -rf ~/serveexport/*

echo "export serve project"
serve export . ~/serveexport/

for f in $FILES
do
	echo "Compiling $f"
	coffee -c -o ~/serveexport/javascripts/ $f
done
