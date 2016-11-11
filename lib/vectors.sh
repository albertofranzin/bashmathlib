#!/bin/sh

# length of space-separated list of values
# len 2 3 4 5
# alias: length
len () {
    v=($@)
    echo ${#v[@]}
}
length () {
    len $@
}

apply () {
    local target=$1
    local dimension=$2
    local func=$3
    shift 3
    local funcparams=($@)


    if [ $dimension -ne 1 ] && [ $dimension -ne 2 ]; then
        echo -e "apply in bashmathlib works only with 2-dimensional arrays. \
                 Sorry for that. Exiting.\n" >&2
        exit 1
    fi
   
    local tmpout=`mktemp`
    if [ $dimension -eq 2 ]; then
        # to apply $func on columns transpose file into a temporary one
        transpose $target $tmpout
    else
        cat $target > $tmpout
    fi

    local rl=()
    mapfile -t rl < $tmpout

    rm -f $tmpout

    local result=""
    for row in "${rl[@]}"; do
        result="$result `$func ${funcparams[@]} $row`"
    done
    echo $result
}

#len 4 5 6 8 3
#length 2 3 4
