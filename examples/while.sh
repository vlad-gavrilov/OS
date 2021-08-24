#!/bin/bash
COUNT=6
while [ $COUNT -gt 0 ]; do
  echo Значение переменной равно: $COUNT
  let COUNT=COUNT-1
done