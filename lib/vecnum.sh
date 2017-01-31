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
# separator of decimal digits is '.'
numsort () {
    local v=($@)
    local a=("$( echo ${v[@]} | tr ' ' \\n | awk '{print $0}' | LC_NUMERIC=us_EN.UTF-8 sort -n | tr \\n ' ' )")
    echo "${a[@]}"
}

# sort a list of numbers in decreasing order
# separator of decimal digits is '.'
revnumsort () {
    local v=($@)
    local a=("$( echo ${v[@]} | tr ' ' \\n | awk '{print $0}' | LC_NUMERIC=us_EN.UTF-8 sort -nr | tr \\n ' ' )")
    echo "${a[@]}"
}

# generate a range of values with a given step, extremes included.
# range 1 100 4: 1 5 9 ... 97
range () {
    local args=($@)
    if [[ `length ${args[@]}` -lt 3 ]]; then
        die 1 "too few arguments provided to range."
    fi
    local start=${args[0]}
    local end=${args[1]}
    local step=${args[2]}
    local range="$start"
    if [[ `equalto $start $end` ]]; then
        local range="$start"    
    elif [[ `equalto $step 0` ]]; then
        die 1 "step value cannot be zero unless first and last value coincide."
    elif  [[ `greaterthan $start $end` && `greaterthan $step 0` ]]; then
        die 1 "cannot generate decreasing sequence with a positive step."
    elif [[ `smallerthan $start $end` && `smallerthan $step 0` ]]; then
        die 1 "cannot generate increasing sequence with a negative step."
    else
        local val=$start
        if [[ `smallerthan $start $end` ]]; then
            while [ `smallerthan $val $end` ]; do
                val=`add $val $step`
                if [[ `smallerequalthan $val $end` ]]; then
                    range="$range $val"
                fi
            done
        else
            while [ `greaterthan $val $end` ]; do
                val=`add $val $step`
                if [[ `greaterequalthan $val $end` ]]; then
                    range="$range $val"
                fi
            done
        fi
    fi
    echo "${range[@]}"
}

#vecsum 2 3 4.6
