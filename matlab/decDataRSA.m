function retval = decDataRSA(ColorVal, d,n)
    message=1;
    for k=1:d
        message=mod(message.*ColorVal,n);
    end
    retval =uint8(message);
end