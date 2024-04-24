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
