#!/bin/bash

# Transposition of a matrix (passed in form of space-separated file).
# from http://stackoverflow.com/questions/1729824
transpose () {
    if [ $# -lt 2 ]; then
        echo -e "Error in transpose: not enough arguments provided. Exiting.\n" >&2
        exit 1
    fi
    local a=$( awk '
    {   if (NF > nf) {
           nf = NF
        }
        for (i=1; i<=nf; i++) {
           row[i] = row[i] $i " "
        }
    }
    END {
        for (i=1; i<=nf; i++) {
           printf("%s\n",row[i])
        }
        exit(0)
    }' $1 )
    echo -e "$a" > $2
}
