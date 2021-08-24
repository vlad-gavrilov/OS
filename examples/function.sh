#!/bin/bash
function function_A {
  echo $1
}
function_B() {
  echo Function B
}
function function_C() {
  echo $1
}
function function_D {
  echo Function D
}

function_A "Function A"
function_B
function_C "Function C"
function_D