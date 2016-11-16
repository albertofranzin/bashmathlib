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
# taskes as input a file containing a matrix of values (no header), computes
# the mean across the columns. Requires R.
colmean () {
    local v=($( Rscript -e "cat(apply(read.table('$1',header=F),2,mean))" ))
    echo ${v[@]}
}

# rowmean
# taskes as input a file containing a matrix of values (no header), computes
# the mean across the rows. Requires R.
rowmean () {
    local v=($( Rscript -e "cat(apply(read.table('$1',header=F),1,mean))" ))
    echo ${v[@]}
}

