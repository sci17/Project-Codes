class Binary_Conversion:
    #INSTANTIATE
    def __init__(self, value):
        self.value = str(value)
        self.sep = self.value.split(".")
        self.val_num = self.sep[0][::-1]
        self.val_deci = None
        self.x = value

    #Decimal to Binary
        
    def decimal_to_binary(self):
        integer_part = int(self.x)
        fractional_part = (self.x) - integer_part

        # Convert integer part to binary
        binary_integer_part = bin(integer_part)[2:]

        # Convert fractional part to binary
        binary_fractional_part = ''
        if fractional_part != 0:
            binary_fractional_part = '.'

            while fractional_part != 0:
                fractional_part *= 2
                bit = int(fractional_part)
                binary_fractional_part += str(bit)
                fractional_part -= bit

        con_1 = str(f"0{binary_integer_part + binary_fractional_part}")
        
        print(con_1[1:])
        return con_1


    #Decimal Process
    def Dec(self):
        Binary_list = []
        Num = 0
        Dec = 1

        for i in range(len(self.val_num)):
            if self.val_num[i] == "1":
                Num += 2 ** i
                Binary_list.append(Num)
                Num = 0
        
        if self.val_num[-1] == "1":
            Binary_list[-1] = -Binary_list[-1]

        if float(self.value) % 1 != 0:
            self.val_deci = self.sep[1][::-1]
            for i in range(len(self.val_deci)):
                if self.val_deci[i] == "1":
                    for x in self.val_deci:
                        Num += 2 ** -Dec
                    
                    Binary_list.append(Num)
        
                Dec += 1

        print(sum(Binary_list))

    #Octal Process
    def Oct(self):
        Binary_list = []
        Dec_list = []
        Octal_list = []
        Count = 1
        Decimal_list = []

        for i in range(0, len(self.val_num), 3):
            Con = self.val_num[i:i+3]
            print(F'con whole {Con}')
            for x in range(len(Con)):
                if Con[x] == "1":
                    Dec_list.append(Count)
                    
                Count += Count

            add = sum(Dec_list)
            Binary_list.append(add)
            Dec_list = []
            Count = 1
            
        if float(self.value) % 1 != 0:
            self.val_deci = self.sep[1][::-1]
            for i in range( 0 ,len(self.val_deci), 3):
                Con =  self.val_deci[i:i+3]
                print(F'con deci {Con}')
                for x in range(len(Con)):
                    if Con[x] == "1":
                        Octal_list.append(Count)
                        
                    Count += Count

                add = sum(Octal_list)
                Decimal_list.append(add)
                Octal_list = []
                print(f"Decimal_list {Decimal_list}")
                Count = 1

            Decimal_list.insert(len(Decimal_list) + 1, ".")

        if self.val_num[-1] == "1":
            result = 0
            while result < 3:
                result = len(Binary_list) / 2
                if result < 3:
                    Binary_list.append(7)

        if Binary_list[-1] == 0:
            Binary_list.pop(-1)
        
        Format_1 = ''.join(map(str, Binary_list[::-1]))
        Format_2 = ''.join(map(str, Decimal_list[::-1]))
        print(f"{Format_1}{Format_2}")

    #Hexa Decimal Process
    def Hexa(self):
        Dic_Hexa = {10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"}
        Binary_list = []
        Hexa_list = []
        Hexa_deci_list = []
        Count = 1
        Hexa = []

        for i in range(0, len(self.val_num), 4):
            Con = self.val_num[i:i+4]

            for x in range(len(Con)):
                if Con[x] == "1":
                    Hexa_list.append(Count)

                Count += Count

            add = sum(Hexa_list)
            Binary_list.append(add)
            Hexa_list = []
            Count = 1

        print(Binary_list)

        if float(self.value) % 1 != 0:
            self.val_deci = self.sep[1][::-1]
            print("reverse" , self.val_deci)
            result = 0
            if result < 4:
                while result < 4:
                    result = len(self.val_deci) / 2
                    self.val_deci = self.val_deci + "0"
                    
            print(f"Val deci {self.val_deci}")
            for i in range (0, len(self.val_deci), 4):
                Con = self.val_deci[i:i+4]
                for x in range(len(Con)):
                    if Con[x] == "1":
                        Hexa.append(Count)

                    Count += Count
            
            add = sum(Hexa)
            Hexa_deci_list.append(add)
            print(f"Hexa_deci_list {Hexa_deci_list}")
            Count = 1

        num_count_1 = 0
        for x in Binary_list:
            if x > 9:
                Binary_list[num_count_1] = Dic_Hexa[Binary_list[num_count_1]]

            num_count_1 += 1

        num_count_2 = 0
        for x in Hexa_deci_list:
            if x > 9:
                Hexa_deci_list[num_count_2] = Dic_Hexa[Hexa_deci_list[num_count_2]]
            
            num_count_2 += 1

        print(Hexa_deci_list)
        format = ''.join(map(str, Binary_list[::-1]))
        print(format)
        
test = Binary_Conversion(8.5)
test.decimal_to_binary()