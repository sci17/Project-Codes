class Student:
    
    def __init__ (self, name, student_number, year_level, program):
        pass

class Registrar:
    pass

class Cashier(Studet):
    def __init__(self):
        self.balance= False
        self.pay= False

    def Check_Balance(self):
        if self.balance ==True:
            print(f'Have balance.')
        else:
            print(f'No Balance')
        
    def Pay_Balance(self):
        if self.pay==True:
            print(f'Balance already paid.')
        else:
            print(f'Please pay your balance.')
            

<<<<<<< HEAD
class Clearance(Student):
    def __init__(self):
        self.orgfee = False
        self.csgfee = False
=======
class Clearance():
    def __init__(self,Name,StudentNumber,YearLevel,Program):
        self.name = Name
        self._studentnumber = StudentNumber
        self.yearlevel = YearLevel
        self.program = Program
        self.OrgFee = False
        self.CsgFee = False
        self.status = True

    def get(self):
        return (self._studentnumber)

    def PayOrg(self):
        if {self.OrgFee}== True:
            return f'{self.name} paid the Org Fee.'

    def CSGFee(self):
        if {self.CsgFee} == True:
            return f'{self.CsgFee} paid the CSG Fee.'

    def signing(self):
        if {self.status}==False:
            return f'The clearance of {self.name} with a student number of {self._studentnumber}///' \
                   f' and a {self.yearlevel} from the program of {self.program} is already signed. '

student1 = clearance("Spledelyn Cristine Recarze",202280045,"2nd Year","BS Computer Science")


print(student1.name)
print(student1.yearlevel)
print(student1.program)
print(student1.OrgFee)
print(student1.CsgFee)
print(student1.status)







>>>>>>> 51df5bb60664d35ac41d19c147b36362bb3748df

        Student.__init__(self,name,year_level,program)

    def Pay_Org(self):
        if self.orgfee==True:
            print(f'Already cleared in Org Fee.')
        elif self.csgfee==True:
            print(f'Already cleared in CSG Fee.')
        else:
            print(f'Is not cleared.')

class Encoder(Student):

    Student.__init__(name, student_number, year_level, program)

    def checkClearance(self):
        pass

    def encodeCourses(self):
        pass

    def prospectus(self):
        pass
