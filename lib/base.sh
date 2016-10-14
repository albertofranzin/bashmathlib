#!/bin/bash

# absolute value
# abs x
# http://forums.devshed.com/unix-help-35/absolute-value-fuction-unix-267780.html
abs () {
    awk -va=$1 'BEGIN {if(a>=0) { print a} else {print a*-1 }}'
}

## tests: comment out when sourcing the scripts
# abs 4
# abs -5.4
