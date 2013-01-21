#!/bin/bash
binaries=`find . -perm +0111 -maxdepth 1 -type f | grep -v '\.sh$' | grep -v '\.plx' | grep -v '\.php' | awk -F'./' '{print $NF}'`
for bin in $binaries
do
	rm $bin
done

interfaces=`ls -a | grep -v '^\.' | awk '{ print $NF }' | grep '.*[.]hi\+'`
for int in $interfaces
do
	rm $int
done

objectFiles=`ls -a | grep -v '^\.' | awk '{ print $NF }' | grep '.*[.]o\+'`
for obj in $objectFiles
do
	rm $obj
done

javaClassFiles=`ls -a | awk '{ print $NF }' | grep '.*[.]class\+'`
for class in $javaClassFiles
do
	rm $class
done
