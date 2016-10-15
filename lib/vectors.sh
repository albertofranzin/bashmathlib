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

#len 4 5 6 8 3
#length 2 3 4
