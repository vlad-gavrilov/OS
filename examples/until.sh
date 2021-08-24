#!/bin/bash
COUNT=6
until [ $COUNT -le 0 ]; do
  echo Значение переменной равно: $COUNT
  let COUNT=COUNT-1
done