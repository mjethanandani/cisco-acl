#!/bin/sh

for i in ../build/Cisco-IOS-XR-*\@$(date +%Y-%m-%d).yang
do
	filename=$(basename "$i")
        name="${filename%.*}"
        echo $name
       	pyang -p ../../ -f tree --tree-line-length=72 ../build/$name.yang > ../build/$name-tree.txt.tmp
	fold -w 71 ../build/$name-tree.txt.tmp > ../build/$name-tree.txt
done
rm ../build/*-tree.txt.tmp
