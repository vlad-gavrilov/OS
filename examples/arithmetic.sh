#!/bin/bash
echo 'Применение let'
# Сложение
let ADDITION=3+5
echo "3 + 5 =" $ADDITION
# Вычитание
let SUBTRACTION=7-8
echo "7 - 8 =" $SUBTRACTION
# Умножение
let MULTIPLICATION=5*8
echo "5 * 8 =" $MULTIPLICATION
# Деление
let DIVISION=4/2
echo "4 / 2 =" $DIVISION
# Остаток от деления
let MODULUS=9%4
echo "9 % 4 =" $MODULUS
# Возведение в степень
let POWEROFTWO=2**2
echo "2 ^ 2 =" $POWEROFTWO

# Примеры двух форматов вычисления арифметических выражений
echo 'Арифметические выражения'
echo 4 + 5 = $((4 + 5))
echo 7 - 7 = $[ 7 - 7 ]
echo 4 x 6 = $((3 * 2))
echo 6 / 3 = $((6 / 3))
echo 8 % 7 = $((8 % 7))
echo 2 ^ 8 = $[ 2 ** 8 ]

# Перевод из различных систем счисления
echo 'Системы счисления'
echo -e "Введите два числа: "
# Считываем введенные пользователем числа
read num1 num2
declare -i result
result=$num1+$num2
echo "Результат: $result"
# Двоичное 10001 в десятичное
result=2#10001
echo $result
# Восьмеричное 16 в десятичное
result=8#16
echo $result
# Шестнадцатеричное 0xE6A в десятичное
result=16#E6A
echo $result