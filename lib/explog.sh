#!/bin/sh

#TODO add checks for validity

# log x
log () {
    echo 'l('$1')' | bc -l
}

#log2 x
log2 () {
    echo 'l('$1')/l(2)' | bc -l
}

# log10 x
log10 () {
    echo 'l('$1')/l(10)' | bc -l
}

# power base exp
# base^exp
# because bc does not allow non-integer exponents, and turning the formula
# around introduces numerical errors, I have to use awk in this awkward way.
power () {
    awk -va=$1 -vb=$2 'BEGIN {print a^b}' /dev/null
}

# exp10 exp
# 10^exp
exp10 () {
    power 10 $1
}

# exp2 exp
# 2^exp
exp2 () {
    power 2 $1
}

# exponential
# e^exp
exp () {
    awk -va=$1 'BEGIN {print exp(a)}' /dev/null
}

# square root
# sqrt x
sqrt () {
    awk -va=$1 'BEGIN {print sqrt(a)}' /dev/null
}

## tests: comment out when sourcing the script
#log 100
#log2 100
#log10 100
#log10 7.5
#power 3 4
#exp 1
#exp2 1
#exp10 1
#power 4.1 3.876
#sqrt 16
#sqrt 5
