function retval = encDataRSA(ColorVal, e, n)
    ColorVal = double(ColorVal);
    
    cipher=1;
    for k=1:e
        cipher=mod(cipher.*ColorVal,n);
    end
    retval = cipher;
end