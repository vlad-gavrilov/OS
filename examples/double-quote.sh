#!/bin/bash
# Инициализируем переменную BASH_VAR
BASH_VAR="Bash Script"
# Выводим значение переменной BASH_VAR
echo $BASH_VAR
# Выводим строку, содержащую значение переменной BASH_VAR и экранированные мета-символы "" (кавычки)
echo "It's $BASH_VAR  and \"$BASH_VAR\" using backticks: `date`"