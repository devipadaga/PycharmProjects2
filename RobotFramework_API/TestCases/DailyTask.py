import re


def pyramidPattern(rows):
    for i in range(rows):
        for k in range(rows-i-1):
            print("-", end="")
        for j in range(2*i+1):
             print("*", end="")
        print()


def removeSplChar_and_addDigits(sample_str):

    print("String before removing spl chars = ", sample_str)
    str = re.sub("[^A-Za-z0-9]", "", sample_str)
    print("String after removing spl chars = ", str)

    sum_digit = 0
    for char in str:
        if char.isdigit():
            digit = int(char)
            sum_digit += digit

    print(sum_digit)


rows = int(input("Enter no.of rows: "))
pyramidPattern(rows)

sample_str = "@33!@#We are Best!@!45&6#$%^8*(*()"
removeSplChar_and_addDigits(sample_str)

    # # using isalnum()
    # print("".join(k for k in sample_str if k.isalnum()))
    #
    # special_char_list = ["$", "@", "#", "&", "%"]
    #
    # # using list comprehension
    # op1 = "".join([k for k in sample_str if k not in special_char_list])
    # print(f"op1 = ", op1)
    #
    # # using lambda function
    # op3 = "".join(filter(lambda x: x not in special_char_list, sample_str))
    # print(f"op3 = ", op3)
