#!/bin/bash

source "../lib/main-library.sh"

say "Hello Cybertern."
say "I am the MadCow."
say "I'd like to play a game."
say "A game that will test your wits, and your endurance..."
say "Your first test will not be easy."
(sleep 1.8; playSound "../assets/ding.wav")&
sayEnd "You may want to ask your friend John..."


while prompt "40be4e59b9a2a2b5dffb918c0e86b3d7"; do
    say "That wasn't quite right."
    sayEnd "You may want to ask your friend John..."
done

say "Excelent Work Cybertern!"
sleep .5
say "Is what I WOULD say..."
(sleep 2.8; playSound "../assets/boom.wav")&
sayEnd "If my grandma hadn't solved it 5 times faster."

say "Maybe I should give you something easier."
say "Surly you can handle some basic mathematics."
sayEnd "What is 32 times 16?"

while prompt "10a7cdd970fe135cf4f7bb55c0e3b59f" "32*16"; do
    sayEnd "That wasn't quite right."
done
say "Ah, One of my favorite numbers!"
