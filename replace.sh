#!/bin/bash
set -e;

if [ $# != 3 ]; then
	echo "Usage: $0 <fix-patch-file> <in-file> <out-file>"
	exit 1;
fi

fix_patch=$1
in=$2
out=$3

gawk '{if (NR==FNR) {patch[$1] = $0; next} if ($1 in patch) print patch[$1]; else print;}' \
	$fix_patch $in > $out

