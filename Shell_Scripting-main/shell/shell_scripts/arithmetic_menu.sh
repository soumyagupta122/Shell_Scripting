#!/bin/bash

display_menu() {
    echo "Menu"
    echo "--------------"
    echo "1: Addition"
    echo "2: Subtraction"
    echo "3: Multiplication"
    echo "4: Division"
    echo "5: Exit"
}

add() {
    echo "Result: $(($1 + $2))"
}

subtract() {
    echo "Result: $(($1 - $2))"
}

multiply() {
    echo "Result: $(($1 * $2))"
}

divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
    else
        echo "Result: $(($1 / $2))"
    fi
}

while true; do

    display_menu
    

    read -p "Enter your choice (1-5): " choice
    
    if [ "$choice" -eq 5 ]; then
        echo "Exiting the program."
        break
    fi

    if [[ "$choice" -ge 1 && "$choice" -le 4 ]]; then
        read -p "Enter the first number: " num1
        read -p "Enter the second number: " num2
    else
        echo "Invalid choice, please try again."
        continue
    fi

    case $choice in
        1)
            add $num1 $num2
            ;;
        2)
            subtract $num1 $num2
            ;;
        3)
            multiply $num1 $num2
            ;;
        4)
            divide $num1 $num2
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
