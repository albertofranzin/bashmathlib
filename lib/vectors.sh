#!/bin/sh

# length of space-separated list of values
# len 2 3 4 5
# alias: length
len () {
    echo $@ | wc -w
}
length () {
    len $@
}

#len 4 5 6 8 3
#length 2 3 4
