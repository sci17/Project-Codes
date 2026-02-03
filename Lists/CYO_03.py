# 1.What is printed by the following statements?
# s="python rocks"
# print(s[3:8])
# it printed hon r, because in tuple slice the number in the left side is going to remove the characters before it. On the other hand, the number in the right side will remove the characters after it.

# 2.What is printed by the following statements?
# alist=[3, 67,"cat",[56,57,"dog"], [], 3.14, False]
# print(alist[4:])
# it printed [], 3.14, False. Because it will only slice the characters before the 4th element since there's no number that's been sliced in the right side.

# 3.What is printed by the following statements?
# L=[0.34,'6','SI106','Python', -2]
# print(len(L[1:-1]))
# it printed 3, it printed 3 because after we slice the elements we put the len to know how many characters are left in the list.

# 4.Create a new list using the 9th through 12th elements(four items in all) of new_lst and assign it to the variable sub_lst.
new_lst=["computer","luxurious","basket","crime",0,2.49,"institution","slice","sun",["water","air","fire","earth"],"games",2.7,"code","java",["birthday","celebration",1817,"party","cake",5],"rain","thunderstorm","top down"]
sub_lst= new_lst[8:12]
print(sub_lst)

