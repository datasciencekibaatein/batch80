# operators 


# to solve the problem we apply operations,
# and we evalate operations using operators

num1 = 34 # assignment operation
num2 = 56

res = num1 + num2 # addition
# num2 and num1 are operands
# and the sign/symbol we are using between those two variables(operands) is called operator
#print(res)


#Arithemetic operators(+,-,*,/,%,**,//)
#Comparision operators(==,!=,>,<,>=,<=)
#Logical operators(and, or , not)
#Bitwise operators(|,&,~,^)
#Assignment operators(=,+=,-=,/=,//=,%=,**=,|=,&=,~=,^=)
#Identity operators(is, is not)
#Membership operators(in, not in)


# docstring

'''
jgls
gjsldjglsdjg
jlgdjsgjreogierjore
fjeroivjger
'''

# Arithemetic operators
num1 = 45
num2 = 87
'''
print("Addition: ",num1+num2)
print("Subtraction: ",num1-num2)
print("Division: ",num2/num1)
print("Multiplication: ",num1 * num2)
print("Floor Division: ",num2//num1)
print("Power: ",num1**2)
'''


#Comparision operators
#Comparision operators will return , boolean value True/False
'''
num1 = -80
num2 = 87

print(num1 == num2) # is my num1 equal to num2 , if it is ->True , if not -> False
print("hello"=="hello") 
print(num1>num2)
print(num1<num2)
print(num1<=num2)
print(num1>=num2)
print(num1!=num2) 
'''


#Logical operators
#logical operators are used to combine two conditions together
'''
age = 22
registered = "yes"
#and 
'''
#if the both conditions are true then i will give you true, however any of condition become false i will return you false
'''
print(age>=18 and registered=="yes") 
#or
'''
#if any of condition become True i will give you true, however all the condtion become false then i will return  false
'''
print(age>=18 or registered=="yes")
#not 
# this is unary operator(which deal with single condition)
# return the opposite value of condition, if true then false , if false then true
print(not age<18)

'''


#bitwise operators

#bitwise operators deals in bits
'''
#1010 -> 10
#1100 -> 12
#1110 - > 14 or

#1000 -> 8 and 

#1010 -> 0010 =2
#101000 -> 

print(10 & 12)
print(10 | 12)
print(~-10) #~n -> -(n+1)
print(10>>2) # shift right
print(10<<2) # shift left 
'''


#Assignment operators
num = 10  
print(num) 
# +=,-=,*=,/= arithimetic assignment operators
# &=, |=, ~= <<=,>>= bitwise assigment operators

# num+=3
# num-=5
# num *=2
print(num)

# bitwise
num = 10 #1010
#2= 0010
num&=2
print(num)