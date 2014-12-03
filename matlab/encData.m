function retval = encryptData(ColorVal, randomVal)
    test = bitxor(ColorVal, randomVal);
    retval = im2uint8(test);
end