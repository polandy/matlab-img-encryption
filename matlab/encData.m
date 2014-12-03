function retval = encryptData(ColorVal, randomVal)
    % colorValInBinary = (ColorVal+1);
    % randomValInBinary = de2bi(randomVal);
    % test = (bitxor(colorValInBinary,randomValInBinary));
    % retval = 3;
    test = bitxor(ColorVal, randomVal);
    retval = im2uint8(test);
end