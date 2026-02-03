from Binary_Operation import binary_operation
from Binary_Conversion import Binary_Conversion

Menu_1 = ["[1] Binary Operations", "[2] Number System", "[3] Exit"]
Menu_2 = ["[1] Division", "[2] Multiplication", "[3] Subtraction", "[4] Addition", "[5] Negative (2's Complement)"]
Menu_3 = ["[1] Binary to X", "[2] Decimal to X", "[3] Octal to X", "[4] Hexa to X"]




while True:
    for x in Menu_1:
        print(x)
        
    user = int(input(":"))
    
    if user == 1:
        for x in Menu_2:
            print(x)
            
        while True:
            user_2 = int(input(":"))

            #Division
            if user_2 == 1:
                print("Division")
                ask_1 = (input("Enter 1:"))
                ask_2 = (input("Enter 2:"))
                obj = binary_operation(ask_1, ask_2)
                print(obj.bin_div())
                break

            #Multiplication
            elif user_2 == 2:
                print("Multiplication")
                ask_1 = (input("Enter 1:"))
                ask_2 = (input("Enter 2:"))
                obj = binary_operation(ask_1, ask_2)
                print(obj.bin_mul())
                break

            #Subtraction
            elif user_2 == 3:
                print("Subtraction")
                ask_1 = (input("Enter 1:"))
                ask_2 = (input("Enter 2:"))
                obj = binary_operation(ask_1, ask_2)
                print(obj.bin_sub())
                break

            #Addition
            elif user_2 == 4:
                print("Addition")
                ask_1 = input("Enter 1:")
                ask_2 = input("Enter 2:")
                obj = binary_operation(ask_1, ask_2)
                print(obj.bin_add())
                break

            #2's comp
            elif user_2 == 5:
                print("2's Complement")
                ask_1 = float(input("Enter:"))
                obj = binary_operation(None, None)
                print(obj.Twos_Complement(ask_1))
                break

            else:
                print("Invalid input please try again")
            
            

    elif user == 2:
        for x in Menu_3:
            print(x)

        while True:
            user_3 = int(input(":"))

            #Binary to X
            if user_3 == 1:
                print("Binary to X\n")
                ask_1 = float(input("Enter"))
                obj = Binary_Conversion(ask_1)
                print(f"Decimal: {obj.Dec()}")
                print(f"Octal: {obj.Oct()}")
                print(f"Hexa Decimal: {obj.Hexa()}")
            
            #Decimal To X
            elif user_3 == 2:
                print("Decimal to X\n")
                ask_1 = float(input("Enter"))
                obj = Binary_Conversion(ask_1)
                temp = obj.decimal_to_binary(obj)

                print(f"Dec{temp}")
                print(f": {obj.Dec(temp)}")
                print(f"Octal: {temp.Oct(temp)}")
                print(f"Hexa Decimal: {obj.Hexa(temp)}")

            #Octal to X
            elif user_3 == 3:
                print("Octa to X")
            
            #Hexa Decimal to X
            elif user_3 == 4:
                print("Hexa Decimal to X")

            else:
                print("Invalid input please try again")

    elif user == 3:
        print("Exit")
        exit()

    else:
        print("Invalid input please try again")