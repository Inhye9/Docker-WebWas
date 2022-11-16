#!/bin/bash
find . -type f -name "*.jar" | while read LINE; do echo $LINE; do echo $LINE; jar tvf $LINE | egrep -i $1; done 
