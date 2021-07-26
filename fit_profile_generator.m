function fit_profile_generator(strFitProfileFilename, strFitParamFilename)

    caProfile = importdata(strFitProfileFilename);
    
    structParams = importdata(strFitParamFilename);
    
    vNumberParams = size(structParams.data,1);
    
    for vParam = 1:vNumberParams
        
        caParamName = structParams.textdata(vParam + 1);
        
        vParamValueLine = FindLineWithStr(caProfile, [caParamName{1},'_value']);
        vParamFixCalcFlagLine = FindLineWithStr(caProfile, [caParamName{1},'_var_fix']);
        
        strNewValueLine = ReplaceNumber(caProfile{vParamValueLine}, structParams.data(vParam));
        
        strNewFixCalcFlagLine = ReplaceNumber(caProfile{vParamFixCalcFlagLine}, 1);
        
        caProfile{vParamValueLine} = strNewValueLine;
        
        caProfile{vParamFixCalcFlagLine} = strNewFixCalcFlagLine;
        
    end
    
    vOptRoutineLine = FindLineWithStr(caProfile, 'Optimisation_routine');
    
    strNewOptRoutineLine = ReplaceNumber(caProfile{vOptRoutineLine}, 4);
    
    caProfile{vOptRoutineLine} = strNewOptRoutineLine;
    
    strNewProfileFileName = strrep(strFitParamFilename, 'fittingparams.csv', 'rerun.txt');
    
    writecell(caProfile, strNewProfileFileName);
     
end