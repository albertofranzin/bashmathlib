#!/bin/sh

# vector sum
# sum 2 3 4 => 9
vecsum () {
    local v=($@)
    # convert to a column and sum the 'first column'
    echo ${v[@]} | tr ' ' \\n | awk '{s+=$0}END{print s}'
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
