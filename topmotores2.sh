#! /bin/sh

# Primer script

csvsort -d '^' -r -c nb_engines $1 | head -2 | csvcut -c model | tail -1 
