Small collection of (mainly mathematical) functions in bash to be used mainly
in my scripts, comes with no warranty of correctness or efficiency
or other kind of help whatsoever. Suggestions and improvements are anyway welcome.

For more advanced stuff you might want to try something more powerful,
like Python, Perl, R or [calc](http://www.isthe.com/chongo/tech/comp/calc/).

###List of functions

* `abs` computes the absolute value of a number
```
abs -5.4   # 5.4
```

* `exp`, `exp2`, `exp10` compute the exponential (resp in base `e`, 2 and 10) of a number
```
exp 1      # 2.71828
exp2 1     # 2
exp10 1    # 10
```

* `len`, `length` length of a space-separated list of values
```
len 4 5 7 3 2 4 6   # 7
length 4 5          # 2
```

* `log`, `log2`, `log10` compute the logarithm (resp. in base `e`, 2 and 10) of a number
```
log 100    # 4.60517018598809136803
log2 100   # 6.64385618977472469580
log10 100  # 2.00000000000000000000
```

* `power` computes the power of two given numbers
```
power 3 4  # 81
```

* `sqrt` computes the square root of a number
```
sqrt 16    # 4
```

* `vecsum` computes the sum of a list of values
```
vecsum 6 3 1   # 10
```
