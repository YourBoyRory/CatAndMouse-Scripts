#!/bin/bash

# say $message
function say {
    clear
    cowsay "$1"
    (
        #killall xcowsay 2>/dev/null
        xcowsay --monitor=0 --reading-speed=100 --at=25,25 "$1" 2>/dev/null
    )&
    espeak --stdout -z "$1" | paplay 2>/dev/null
    sleep .5
}
export -f say

# sayEnd $message
function sayEnd {
    clear
    cowsay "$1"
    (
        #killall xcowsay 2>/dev/null
        xcowsay --monitor=0 --reading-speed=100 --at=25,25 "$1" 2>/dev/null
    )&
    espeak --stdout "$1" | paplay 2>/dev/null
    sleep 1.5
}
export -f sayEnd

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

# prompt $hash $prompt*
function prompt {
    echo $input
    text=$2
    if [[ "$text" == "" ]]; then
        text=$1
    fi
    if xset q &>/dev/null; then
        local pass=$(yad --title="Puzzle" --text="$text" --entry --button=Done)
    else
        echo "$text"
        read -p "Enter Answer: " pass
    fi
    pass=$(echo ${pass,,} | awk '{ gsub(/[[:space:]]/, ""); print }')
    echo $pass
    testHash "$pass" "$1"
}
export -f prompt

# play $sound
function playSound {
    paplay "$1" 2>/dev/null
}
export -f playSound
