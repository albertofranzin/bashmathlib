#!/bin/sh

# vector sum
# sum 2 3 4 => 9
vecsum () {
    # convert to a column and sum the 'first column'
    echo $@ | tr ' ' \\n | awk '{s+=$0}END{print s}'
}

#vecsum 2 3 4.6
