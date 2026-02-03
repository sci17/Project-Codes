  
class binary_operation:
    def __init__(self, value_1, value_2):
        self.value_1 = str(value_1)
        self.value_2 = str(value_2)

    # Converting Binary to Decimal
    def Bin_dec(self, val_num):
        return int(val_num, 2)

    # Converting Decimal to Binary
    def Dec_bin(self, val):
        return bin(int(val)).replace("0b", "")  # Convert val to integer before using bin()

    # Handle the binary decimal point converting to Decimal
    def decimal_point(self, decimal_point_val):
        decimal_points = decimal_point_val
        Decimal_number = 0

        for i in range(len(decimal_points)):
            Decimal_number += int(decimal_points[i]) * (2 ** -(i + 1))

        return Decimal_number

    # Separate The whole number and decimal point
    def slice_index(self, val_index):
        sep = str(val_index).split(".")
        return sep

    # Identify if there's decimal point
    def Identify(self, iden_val):
        search = iden_val

        if float(search) % 1 != 0:
            Step_1 = self.slice_index(iden_val)
            Step_2 = self.Bin_dec(Step_1[0])
            Step_3 = self.decimal_point(Step_1[1])
            return Step_2 + Step_3
        else:
            return self.Bin_dec(iden_val)

    # Converting the decimal to binary
    def decimal_to_binary(self, decimal, precision=8):
        int_part = int(decimal)
        deci_part = decimal - int_part
        binary_int = bin(int_part).replace("0b", "")
        binary_deci = ''

        for _ in range(precision):
            deci_part *= 2
            binary_digit = int(deci_part)
            binary_deci += str(binary_digit)
            deci_part -= binary_digit

        return f"{binary_int}.{binary_deci}"
    
    def signed_number(self):
        pass

    # Addition Operation
    def bin_add(self):
        dec_num1 = self.Identify(self.value_1)
        dec_num2 = self.Identify(self.value_2)
        dec_sum = dec_num1 + dec_num2
        print("Here", dec_num1)

        if dec_sum % 1 != 0:
            Step_1 = self.slice_index(dec_sum)
            Step_2 = self.Dec_bin(Step_1[0])
            Step_3 = self.decimal_to_binary(float(f"0.{Step_1[1]}"), precision=len(Step_1[1]) * 2)
            bin_ans = f"{Step_2}.{Step_3[2:]}"
           
            return bin_ans
        
        else:
            Step_1 = self.Dec_bin(dec_sum)
            return Step_1

    # Subtraction Operation
    def bin_sub(self):
        dec_num1 = self.Identify(self.value_1)
        dec_num2 = self.Identify(self.value_2)
        dec_diff = dec_num1 - dec_num2

        if dec_diff % 1 != 0:
            Step_1 = self.slice_index(dec_diff)
            Step_2 = self.Dec_bin(Step_1[0])
            Step_3 = self.decimal_to_binary(float(f"0.{Step_1[1]}"), precision=len(Step_1[1]) * 2)
            bin_ans = f"{Step_2}.{Step_3[2:]}"
            return bin_ans

        else:
            Step_1 = self.Dec_bin(dec_diff)
            return Step_1

    # Multiplication Operation
    def bin_mul(self):
        dec_num1 = self.Identify(self.value_1)
        dec_num2 = self.Identify(self.value_2)
        dec_prod = dec_num1 * dec_num2

        if dec_prod % 1 != 0:
            Step_1 = self.slice_index(dec_prod)
            Step_2 = self.Dec_bin(Step_1[0])
            Step_3 = self.decimal_to_binary(float(f"0.{Step_1[1]}"), precision=len(Step_1[1]) * 2)
            bin_ans = f"{Step_2}.{Step_3[2:]}"

            if self.value_1[0] == "1" and self.value_2[0] == "1":         
                return bin_ans
            
            elif self.value_1[0] == "1" or self.value_2[0] == "1":
                return self.Twos_Complement(bin_ans)
        
        else:
            Step_1 = self.Dec_bin(dec_prod)

            if self.value_1[0] == "1" and self.value_2[0] == "1":         
                return Step_1
            
            elif self.value_1[0] == "1" or self.value_2[0] == "1":
                return self.Twos_Complement(Step_1)
            
        
    # Division Operation
    def bin_div(self):
        dec_num1 = self.Identify(self.value_1)
        dec_num2 = self.Identify(self.value_2)
        dec_quo = dec_num1 / dec_num2
        print("Answer Decimal: ", dec_quo)

        if dec_quo % 1 != 0:
            Step_1 = self.slice_index(dec_quo)
            print("here 1", Step_1)
            Step_2 = self.Dec_bin(Step_1[0])
            Step_3 = self.decimal_to_binary(float(f"0.{Step_1[1]}"), precision=len(Step_1[1]) * 2)
            print("here",Step_3)
            bin_ans = f"{Step_2}.{Step_3[2:]}"
            print()

            if self.value_1[0] == "1" and self.value_2[0] == "1":         
                return bin_ans
            
            elif self.value_1[0] == "1" or self.value_2[0] == "1":
                return self.Twos_Complement(bin_ans)
        
        else:
            Step_1 = self.Dec_bin(dec_quo)

            if self.value_1[0] == "1" and self.value_2[0] == "1":         
                return Step_1
            
            elif self.value_1[0] == "1" or self.value_2[0] == "1":
                return self.Twos_Complement(Step_1)
            
            
            return Step_1
       
    # 2's Complement Operation
    def Twos_Complement(self, val):
        self.value_1 = str(val[::-1])
        if len(self.value_1) == 1:
            return '000' + self.value_1
        
        answer = ''
        change = False

        for i in self.value_1:
            if change:
                if i == '0':
                    answer += '1'
                elif i == '1':
                    answer += '0'
                else:
                    answer += '.'
            else:
                answer += i

            if i == '1':
                change = True

        return answer[::-1]

# Example usage:
test = binary_operation("1111", "1111")
print(test.bin_add())
