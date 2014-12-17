function retval = encDataRSA(ColorVal, e, n)
    retval = mod(ColorVal.^e, n);
end