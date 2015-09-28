#!/bin/sh
export LANG=C.UTF-8
mkdir -p out
javac -d out Main.java
java -cp out Main