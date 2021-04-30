# C++-Test-Checker

## Execute TEST
```
./check.sh namiko 0 # This is sample
./check.sh <directory name> <section number>
```

## How to create TEST
- Create cpp file and implement function under `section<num>` directory
- Create a `section<num>` directory with the same name that contains the cpp files under `test` directory
- Create a file with the same name as the file you want to test.
    - If you want to create a test for 1-1 of section1, create a file `test/section1/1-1-1`. 1-1-1 represents the first test of 1-1. If you want to create the second test of 1-1, name it 1-1-2. expected` extension.
    - Please note that currently only 10 test number files (0-9) can be created.
- `. /check.sh <name of the directory you want to test> <section number>` to run it. The output will look like the following.

```
$ ./check.sh namiko 0
Start tests
---------------------------------------
Passed Section0 test/section0/1-0-0
---------------------------------------
Failed Section0 test/section0/1-0-1
Result: namiko, Expected: tori
---------------------------------------
total 2 cases
1 cases passed, 1 cases failed
```