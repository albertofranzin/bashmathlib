#!/bin/sh

# vector sum
# vecsum 2 3 4 => 9
vecsum () {
    local v=($@)
    # convert to a column and sum the 'first column'
    echo ${v[@]} | tr ' ' \\n | awk '{s+=$0}END{print s}'
}

# vector product
# vecprod 2 3 4 => 24
# https://rosettacode.org/wiki/Sum_and_product_of_an_array#AWK
vecprod () {
    local v=($@)
    local l=`length $@`
    echo ${v[@]} | awk 'func prod(s){split(s,a);r=1;for(i in a)r*=a[i];return r}{print prod($0)}' 
}

# sort a list of numbers
numsort () {
    local v=($@)
    local a=("$( echo ${v[@]} | tr ' ' \\n | awk '{print $0}' | sort -n | tr \\n ' ' )")
    echo "${a[@]}"
}

# sort a list of numbers in decreasing order
revnumsort () {
    local v=($@)
    local a=("$( echo ${v[@]} | tr ' ' \\n | awk '{print $0}' | sort -nr | tr \\n ' ' )")
    echo "${a[@]}"
}

#vecsum 2 3 4.6
