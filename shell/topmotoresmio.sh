#!/bin/sh

# Esto es un comentario.

csvsort -d '^' -c nb_engines optd_aircraft.csv | csvcut -c manufacturer, model | tail -1
