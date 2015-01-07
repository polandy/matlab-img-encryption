function retval = encData(ColorVal, randomVal)
    encrypted = bitxor(ColorVal, randomVal);
    retval = im2uint8(encrypted);
end
