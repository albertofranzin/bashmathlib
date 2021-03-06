Small collection of (mainly mathematical) functions in bash to be used mainly
in my scripts as proxies for existing functions, comes with no warranty of
correctness or efficiency or other kind of help whatsoever.
Suggestions and improvements are anyway welcome.

For more advanced stuff you might want to try something more powerful,
like Python, Perl, R or [calc](http://www.isthe.com/chongo/tech/comp/calc/).

### Usage
Clone the repo, then in your bash script add
```
source /path/to/bashmathlib/mathlib.sh
```

Expressions can be combined using `$( ... )`:
```
sqrt $( mult $( divide 12 2 ) $( subtract 8 2 ) )   # 6
```

You better include also the [util lib](https://github.com/albertofranzin/bashutillib)
when using this one.

### List of functions

* `abs` computes the absolute value of a number.
```
abs -5.4   # 5.4
```

* `add`,`subtract`,`mult`,`divide` compute, respectively, the sum, subtraction,
product and division of two numbers. For vector sum and product use `vecsum`
and `vecprod`. To apply the operation to each element of a vector use
`pointwise{add/subtract/mult/divide}`
```
add 3 1.5       # 4.5
subtract 3 1.5  # 1.5
mult 3 1.5      # 4.5
divide 3 1.5    # 2
```

* `apply` apply a function over the rows or the columns of a matrix.
Arguments are the matrix, the dimension, the function, followed by
optional arguments for the function. The output is an array.
Works only on 2-d matrices stored in files, `1` means apply the
function on the rows, `2` means to apply over the columns.
Uses temporary files, so it is probably much slower than other solutions.
```
echo -e "1 2 3 4 5\n6 7 8 9 10" > table.txt
apply table.txt 1 avg
# 3 8
apply table.txt 2 avg
# 3.5 4.5 5.5 6.5 7.5
```

* `avg`, `average`, `mean` compute the average value in a list of numbers.
Different aliases are there for otherwise I will never remember how which
one really is.
```
avg 3 5 7 9   # 6
```

* `exp`, `exp2`, `exp10` compute the exponential (resp in base `e`, 2 and 10)
of a number.
```
exp 1      # 2.71828
exp2 1     # 2
exp10 1    # 10
```

* `greaterthan`, `greaterequalthan`, `smallerthan`, `smallerequalthan`, `equalto`
compare two given numbers. Output is `"1"` if the expression if true, and `""`
(the empty string) otherwise.
```
greaterthan 1 4       # false
greaterequalthan 1 4  # false
smallerthan 1 4       # true
smallerequalthan 1 4  # true
equalto 4 4.0         # true
if [[ `greaterthan 3.4 1.3` ]]; then
    echo "yes!"
else
    echo "no!"
fi
# yes!
```

* `len`, `length` length of a space-separated list of values.
```
len 4 5 7 3 2 4 6   # 7
length 4 5          # 2
```

* `log`, `log2`, `log10` compute the logarithm (resp. in base `e`, 2 and 10)
of a number.
```
log 100    # 4.60517018598809136803
log2 100   # 6.64385618977472469580
log10 100  # 2.00000000000000000000
```

* `max`, `min`, `median` return respectively the maximum, minimum and median
value in a list of numbers.
```
max 4 7 4 2 5 6 8 3     # 8
min 4 7 4 2 5 6 8 3     # 2
median 4 7 4 2 5 6 8 3  # 4.5
```

* `numsort`, `revnumsort` sort a list of numbers in ascending and descending
order, respectively.
```
numsort 5 2 6 9     # 2 5 6 9
revnumsort 5 2 6 9  # 9 6 2 5
```

* `pointwiseadd`, `pointwisesubtract`, `pointwisemult`, `pointwisedivide` apply
an operation to each element of a vector. The value to be
added/subtracted/multiplied/divided is the first parameter.
```
pointwiseadd 1.5 1 2 3        # 2.5 3.5 4.5
pointwisesubtract 1.5 1 2 3   # -0.5 0.5 1.5
pointwisemult 1.5 1 2 3       # 1.5 3 4.5
pointwisedivide 1.5 1 2 3     # 0.666667 1.33333 2
```

* `power` computes the power of two given numbers.
```
power 3 4  # 81
```

* `range` generates a range of values from start to end (included) with a
given step.
```
range 1 10 1   # 1 2 3 4 5 6 7 8 9 10
range 1 10 2   # 1 3 5 7 9
range 10 1 -1  # 10 9 8 7 6 5 4 3 2 1
range 10 1 -2  # 10 8 6 4 2
range 1 2 0.1  # 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2
```

* `rowmean`, `colmean` compute the mean over the rows and columns
(respectively) of a matrix given via an input file
(in space-separated values format, no header). Both require R.
```
echo -e "1 2 3 4 5\n6 7 8 9 10" > table.txt
rowmean table.txt
# 3 8
colmean table.txt
# 3.5 4.5 5.5 6.5 7.5
```

* `rpd` compute the relative percentage deviation of two values `a` and `b`.
```
rpd 10500 10000   # 5
```

* `sqrt` computes the square root of a number.
```
sqrt 16    # 4
```

* `stddev` compute the standard deviation of a list of values.
```
stddev 1 2 3 4 5 6 7 8 9 10   # 3.02765
```

* `transpose` transposes a 2-d matrix stored in a file and saves the output
in another file. Input and output files are the two arguments.
```
echo -e "1 2 3\n4 5 6" > table.txt
transpose table.txt table_transposed.txt
cat table_transposed.txt
# 1 4
# 2 5
# 3 6
```

* `variance` compute the variance of a list of values.
```
variance 1 2 3 4 5 6 7 8 9 10    # 9.16667
```

* `vecsum`,`vecprod` compute respectively the sum and the product of
a list of values.
```
vecsum 6 3 1   # 10
vecprod 6 3 1  # 18
```
