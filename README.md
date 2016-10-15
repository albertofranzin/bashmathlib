Small collection of (mainly mathematical) functions in bash to be used mainly
in my scripts as proxies for existing functions, comes with no warranty of
correctness or efficiency or other kind of help whatsoever.
Suggestions and improvements are anyway welcome.

For more advanced stuff you might want to try something more powerful,
like Python, Perl, R or [calc](http://www.isthe.com/chongo/tech/comp/calc/).

###List of functions

* `abs` computes the absolute value of a number
```
abs -5.4   # 5.4
```

* `avg`, `average`, `mean` compute the average value in a list of numbers.
Different aliases are there for otherwise I will never remember how which
one really is.
```
avg 3 5 7 9   # 6
```

* `exp`, `exp2`, `exp10` compute the exponential (resp in base `e`, 2 and 10)
of a number
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

* `log`, `log2`, `log10` compute the logarithm (resp. in base `e`, 2 and 10)
of a number
```
log 100    # 4.60517018598809136803
log2 100   # 6.64385618977472469580
log10 100  # 2.00000000000000000000
```

* `max`, `min`, `median` return respectively the maximum, minimum and median
value in a list of numbers
```
max 4 7 4 2 5 6 8 3     # 8
min 4 7 4 2 5 6 8 3     # 2
median 4 7 4 2 5 6 8 3  # 4.5
```

* `numsort`, `revnumsort` sort a list of numbers in ascending and descending
order, respectively
```
numsort 5 2 6 9     # 2 5 6 9
revnumsort 5 2 6 9  # 9 6 2 5
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
