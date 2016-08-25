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
testString "WHY THE FUCK WILL THIS NOT WORK?" ./auto.sh 'head'

testString "Jake should say Mathemagical" ./jake.sh 'Mathemagical'
testString "DUPPE DUPPE DUKKE DAK" ./dak.sh 'DAK'
testString "Hej med dig, Mads" ./mads.sh 'Mads'
#testString "I would like to pass yet another task" ./another.sh 'Task'

testString "HELLO MISTER. I DO NOT GET THESE SHELL COMMANDS" ./mark.sh 'SOMETHING'

#testString "HELLO" ./hello.sh 'HELLO'

echo "SUCCESS! COME ON!" 

