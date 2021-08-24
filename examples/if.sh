#!/bin/bash
directory="./BashScripting"
# Существует ли заданная директория?
if [ -d $directory ]; then
  echo "Directory exists"
else
  echo "Directory does not exist"
fi