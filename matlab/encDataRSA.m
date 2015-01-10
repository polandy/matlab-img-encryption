function retval = encDataRSA(ColorVal, e, n)
    ColorVal = double(ColorVal);
    
    cipher=1;
    % workaround for calculating  the power of e
    for k=1:e
        cipher=mod(cipher.*ColorVal,n);
    end
    retval = cipher;
end