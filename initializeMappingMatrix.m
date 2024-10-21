% Initialize the mapping matrix
function mappingMatrix = initializeMappingMatrix(skinTones, undertones)
    %  P1,P2,P3,P4,P5 in mappingMatrix are choosen according to different types of skinTones and undertones-
    % 'P1'-  Deep & Warm
    % 'P2'- Deep & Neutral
    %  P3'- Deep & Cool
    %  P2'-Medium & Warm
    % 'P3'- Medium & Neutral
    % 'P4'-Medium & Cool
    % 'P3'- Fair & Warm
    % 'P4'- Fair & Neutral
    % 'P5'-Fair & Cool

   mappingMatrix = {'P1', 'P2', 'P3'; 
                 'P2', 'P3', 'P4'; 
                 'P3', 'P4', 'P5'};
end