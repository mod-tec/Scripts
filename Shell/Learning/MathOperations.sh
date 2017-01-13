#!/bin/bash

echo " Select operation "
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

read OP
clear

echo "Enter first operand"
read OP_A
echo "Enter second operand"
read OP_B
case $OP in
	1)
	OP_C=$[${OP_A} + ${OP_B}];;
	2)
	OP_C=$[${OP_A} - ${OP_B}];;
	3)
	OP_C=$[${OP_A} * ${OP_B}];;
	4)
	OP_C=$[${OP_A} / ${OP_B}];;
esac

echo " Answer is ${OP_C} ";
read -p "Press ENTER to exit"