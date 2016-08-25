#!/bin/bash

testsPassed=0
function testString {
    if [ ! -f $2 ]; then
        echo "File $2 not found!"
        exit 2
    fi

    if eval $2  | grep -q "$3"; then
        testsPassed=$((testsPassed+1))
    else
        echo "**** Assert Failed! ****"
        echo $1
        echo "************************"
        exit 1
    fi
}

testString "Finn should say ADVENTURE TIME" ./finn.sh 'ADVENTURE TIME'
testString "Jake should say Mathemagical" ./jake.sh 'Mathemagical'
testString "HELLO MISTER. I DO NOT GET THESE SHELL COMMANDS" ./mark.sh 'SOMETHING'
testString "Ooooh, I may be in way over my head" ./automated.sh 'head'
testString "HEJ" ./hello.sh 'HEJ'
echo "SUCCESS!" 

