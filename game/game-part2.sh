#!/bin/bash

source "../lib/main-library.sh"

say "Hello Cybertern."
say "I am the MadCow."
say "I'd like to play a game."
say "A game that will test your wits, and your endurance..."
say "Your first test will not be easy."
(sleep 1.8; playSound "../assets/ding.wav")&
sayEnd "You may want to ask your friend John..."


while prompt "83218ac34c1834c26781fe4bde918ee4"; do
    say "That wasn't quite right."
    sayEnd "You may want to ask your friend John..."
    echo done
done

say "Excelent Work Cybertern!"
sleep .5
say "Is what I WOULD say..."
(sleep 2.8; playSound "../assets/boom.wav")&
sayEnd "If my grandma hadn't solved it 5 times faster."
