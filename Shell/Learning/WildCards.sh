#!/bin/bash

VAR=abc.def.ghi.jkl
#show last
VAR2=${VAR##*.} 
echo $VAR2 #jkl

#strip beginning
VAR2=${VAR#*.} 
echo $VAR2 #def.ghi.jkl

#strip last
VAR3=${VAR%.*} 
echo $VAR3 #abc.def.ghi

#show beginning
VAR3=${VAR%%.*} 
echo $VAR3 #abc