#!/bin/bash
# Вывод 1-го, 2-го и 3-го аргументов
echo $1 $2 $3

# Запись в массив arg_arr всех переданных аргументов
arg_arr=("$@")

# Вывод 1-го, 2-го и 3-го аргументов через массив arg_arr
echo ${arg_arr[0]} ${arg_arr[1]} ${arg_arr[2]}

# Вывод аргументов массива с помощью $@
echo $@

# Вывод количества аргументов, переданных в скрипт
echo Number of arguments passed: $#