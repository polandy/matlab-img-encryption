function retval = encryptDataWithRSA(ColorVal, randomVal)
    encrypted = bitxor(ColorVal, randomVal);
    retval = im2uint8(encrypted);
end