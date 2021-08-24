#!/bin/bash
# При получении сигнала INT будет вызвана функция bashtrap
trap bashtrap SIGINT
# Очистить экран
clear;
# Функция bashtrap
bashtrap()
{
  echo
  echo "Обнаружен вызов CTRL+C! Выполняю функцию bashtrap!"
}
# Цикл от 1 до 10
for a in `seq 1 10`; do
  echo "$a/10 to Exit."
  sleep 1;
done
echo "Exit Bash Trap Example!!!"