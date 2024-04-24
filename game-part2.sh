#!/bin/bash

# say $message
say() {
    echo "$1"
    (
        #killall xcowsay 2>/dev/null
        xcowsay --at=25,25 "$1" 2>/dev/null 
    )&
    espeak "$1" 2>/dev/null
    sleep 1
}

# testHash $input $hash
testHash() {
    local hash=$(echo -n "$1" | md5sum | awk '{print $1;}')
    if [[ $hash == $2 ]]; then
        return 1
    else
        return 0
    fi
}

# promt $hash
promt() {
    if xset q &>/dev/null; then
        local pass=$(yad --text="$1" --entry --button=Done)
    else
        echo "$1"
        read -p "Enter Password: " pass
    fi
    testHash "$pass" "$1"
}

say "Hello Cybertern."
say "I'd like to play a game."
say "A game that will test your wits, and your endurance..."
say "Your first test will not be easy."
say "You may want to ask your friend John..."

while promt "83218ac34c1834c26781fe4bde918ee4"; do
    say "That wasn't quite right."
done

say "Excelent Work Cybertern"
say "I would say that..."
say "If my grandma hadn't solved it 5 times faster."

