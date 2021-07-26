function strUpdated = ReplaceNumber(strToUpdate, vNewVal)

    caSplitString = split(strToUpdate, '=');
    
    strUpdated = [caSplitString{1}, '= "', num2str(vNewVal),'"'];

end