#!/bin/sh

# hat tip: http://stackoverflow.com/questions/192292/
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
DIR="$DIR/lib"
. "$DIR/base.sh"
. "$DIR/explog.sh"
. "$DIR/matrix.sh"
. "$DIR/stats.sh"
. "$DIR/vectors.sh"
. "$DIR/vecnum.sh"

