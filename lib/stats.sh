#!/bin/sh

# average value of a list of values
# agv 4 5 6 7 => 5.5
# aliases: average, mean
avg () {
    local s=$( vecsum $@ )
    local l=$( len $@ )
    awk -va=$s -vb=$l 'BEGIN {print a/b }' /dev/null
}
average () {
    avg $@
}
mean () {
    avg $@
}

# max of a list of values
max () {
    local v=($@)
    local m=${v[0]}
    for a in ${v[@]}; do
        if [[ `greaterthan $a $m` ]]; then m=$a; fi
    done
    echo $m
}

# min of a list of values
min () {
    local v=($@)
    local m=${v[0]}
    for a in ${v[@]}; do
        if [[ `smallerthan $a $m` ]]; then m=$a ; fi
    done
    echo $m
}

# median of a list of values
median () {
    #local v=($@)
    local v=($( numsort $@ ))
    local l=$( len ${v[@]} )
    local m=0
    if (( $l % 2 == 0 )); then
        # even
        local i=$(( l / 2 - 1  ))
        local vi=${v[$i]}
        local vj=${v[$i+1]}
        local m=$( avg $vi $vj )
    else
        # odd
        local i=$(( divide l 2 ))
        local m=${v[$i]}
    fi
    echo $m
}

# colmean
# takes as input a file containing a matrix of values (no header), computes
# the mean across the columns. Requires R.
colmean () {
    local v=($( Rscript -e "cat(apply(read.table('$1',header=F),2,mean))" ))
    echo ${v[@]}
}

# rowmean
# takes as input a file containing a matrix of values (no header), computes
# the mean across the rows. Requires R.
rowmean () {
    local v=($( Rscript -e "cat(apply(read.table('$1',header=F),1,mean))" ))
    echo ${v[@]}
}

# rpd
# takes in input two values a and b, compute the
# relative percentage deviation (a-b)/b * 100.
rpd () {
    local a=${1}
    local b=${2}
    awk -va=$a -vb=$b 'BEGIN {print (a-b)/b * 100}' /dev/null
}

# variance
# takes in input an array of values, computes the variance.
variance () {
    local v=($@)
    local l=$( len ${v[@]} )
    local a=$( avg ${v[@]} )
    local ll=$( pointwisesubtract $a ${v[@]} )
    local d=""
    for i in ${ll[@]} ; do
       d="$d`mult $i $i` "
    done
    local res=$( divide $( vecsum ${d[@]} ) $( subtract $l 1 ) )
    echo $res
}

# stddev
# takes in input an array of values, computes the standard deviation.
stddev () {
    local v=$( variance ${@} )
    local vv=$( sqrt $v )
    echo $vv
}
