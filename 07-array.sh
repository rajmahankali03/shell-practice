#!/bin/bash
Movies=("Indra" "Tagoor" "SVSK")
echo "Movie no one is ${Movies[0]}"
echo "Movie no one is ${Movies[2]}"
echo "Movie no one is ${Movies[4]}" # index which is not avaialble 

echo "Movie names ${Movies[@]}" #to print all in an array

