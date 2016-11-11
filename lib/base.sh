#!/bin/bash

# absolute value
# abs x
# http://forums.devshed.com/unix-help-35/absolute-value-fuction-unix-267780.html
abs () {
    awk -va=$1 'BEGIN {if(a>=0) { print a} else {print a*-1 }}'
}

# add two numbers.
# add 5 7
# For more numbers: use vecsum.
add () {
    awk -va=$1 -vb=$2 'BEGIN {print a+b}'
}

# subtract two numbers
# subtract 7 4
subtract () {
    awk -va=$1 -vb=$2 'BEGIN {print a-b}'
}

# multiply two numbers
# mult 4 5
# For more numbers: use vecprod.
mult () {
    awk -va=$1 -vb=$2 'BEGIN {print a*b}' 
}

# divide two numbers
# divide 10 4
divide () {
    awk -va=$1 -vb=$2 'BEGIN {print a/b}'
}


## tests: comment out when sourcing the scripts
# abs 4
# abs -5.4
