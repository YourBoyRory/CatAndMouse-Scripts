#!/bin/bash

source "../lib/main-library.sh"

say "Hello Cybertern."
say "I'd like to play a game."
say "A game that will test your wits, and your endurance..."
say "Your first test will not be easy."
(sleep 1.8; playSound "../assets/ding.wav")&
sayEnd "You may want to ask your friend John..."


while promtPassword "83218ac34c1834c26781fe4bde918ee4"; do
    sayEnd "That wasn't quite right."
done

say "Excelent Work Cybertern!"
sleep .5
say "Is what I WOULD say..."
(sleep 2.8; playSound "../assets/boom.wav")&
sayEnd "If my grandma hadn't solved it 5 times faster."
