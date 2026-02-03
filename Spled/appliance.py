class Appliance:

    def __init__(self, area, type, brand):
        self.area = area
        self.type = type
        self.brand = brand
        self.poweron = False
        self.wash = True


    def place(self):
        return (f'You can find the {self.type} in the back of the house.')

    def power(self):
        self.poweron = True
        return (f'The {self.type} is turned on. ')

    def clean(self):
        self.wash = False
        return (f'The {self.type} stopped washing clothes.')

    def dry(self):
        return (f'The {self.type} is drying the clothes.')

appliance1 = Appliance("Back of the house","Washing Machine", "LG")

print(appliance1.type)
print(appliance1.brand)
print(appliance1.place())
print(appliance1.power())
print(appliance1.clean())
print(appliance1.dry())






