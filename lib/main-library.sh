#!/bin/bash

# say $message
function say {
    echo "$1"
    (
        #killall xcowsay 2>/dev/null
        xcowsay --at=25,25 "$1" 2>/dev/null 
    )&
    espeak "$1" 2>/dev/null
    sleep 1
}
export -f say

# testHash $input $hash
function testHash {
    local hash=$(echo -n "$1" | md5sum | awk '{print $1;}')
    if [[ $hash == $2 ]]; then
        return 1
    else
        return 0
    fi
}
export -f testHash

# promt $hash
function promt {
    if xset q &>/dev/null; then
        local pass=$(yad --text="$1" --entry --button=Done)
    else
        echo "$1"
        read -p "Enter Password: " pass
    fi
    testHash "$pass" "$1"
}
export -f promt

# play $sound
function playSound {
    play "$1" 2>/dev/null 
}
export -f playSound
