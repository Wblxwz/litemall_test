import random
import string

def custom_random_num(length:int)->int:
    if length <= 0:
        raise ValueError("length must greater 0")
    if length == 1:
        return random.randint(0,9)
    start = length - 1
    random_int = random.randint(10 ** start,10 ** length - 1)
    #RF会隐式转换纯数字字符串为整数
    return random_int

def custom_random_str()->str:
    chars = string.ascii_letters + string.digits + string.punctuation
    random_str = ""
    length = random.randint(1,16)
    for i in range(length):
        random_str += random.choice(chars)
    return random_str

if __name__ == "__main__":
    for i in range(10):
        print(custom_random_num(10))