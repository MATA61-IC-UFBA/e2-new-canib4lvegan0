#!/bin/bash
# no parameter
# Use make compile to generate "valida" before running this script.

T1=$(pwd)
tests="$T1/tests"

# The function total_files reports a total number of files for a given directory. 
function total_files {
        find $1 -type f | wc -l
}

# Copy the executable file "valida" to the tests folder.
cp "$T1/analisa-e2" tests

# Get the tests in folder inputs
cd "$tests"
mytests=$(ls *.in)

echo "running tests for E2  .."

for t in $mytests; do
    name="$(basename $t .in).out"
    ora="$(basename $t .in).ora"
    echo "running $t ..."
    ./analisa-e2 < "$tests/$t" > "$tests/$name"
    n1=`diff -bB -iw "$tests/$name" "$tests/$ora" | grep "^>" | wc -l`
    n2=`diff -bB -iw "$tests/$name" "$tests/$ora" | grep "^<" | wc -l`
    if [[ $n1 -eq 0 ]] && [[ $n2 -eq 0 ]] ; then
        echo "PASS"
    else
        echo "FAIL"
    fi
done

rm "$tests/analisa-e2"
rm "$T1/analisa-e2"
rm "$T1/lex.yy.c"
cd "$T1"

