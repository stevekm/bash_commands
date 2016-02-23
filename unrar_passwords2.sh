#!/bin/bash
# On Mac OS X, unrar a bunch of files 
PassList="password1 password2 password3" && OldDir="$(pwd)"
for i in $PassList; do
	for q in $(find . -name "*.rar"); do
		echo "$q"
		NewDir=$(dirname "$q")
		echo -e "\t$NewDir"
		cd "$NewDir"
		~/Downloads/rar/unrar e -p${i} *.rar
		cd "$OldDir"
	done
done

# or do this one; use p7zip (from homebrew), OS X
for i in $PassList; do
	for q in $(find -E . \( ! -regex '.*/\..*' \) -regex '.*(rar|7z)$'); do
		echo "$q"
		# NewDir=$(dirname "$q")
		# echo -e "\t$NewDir"
		# cd "$NewDir"
		7z x "$q" -p$i
		# cd "$OldDir"
	done
done

# support multi-part rar
PassList="password1 password2 password3" 
for i in $PassList; do 
	FILES=$(find -E . -type f -regex '.*(rar|7z)$' -regex '.*part1.*');
	for q in $FILES; do 
		echo "$q" ;
		7z x "$q" -p$i 
	done
	
done
