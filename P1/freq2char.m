function character = freq2char(freq)
%Converts a sum of frequencies to a character

    %
    %         1209     1336    1477
    % -------------------------------
    %  697  |   1   |   2   |   3   |
    %  770  |   4   |   5   |   6   |
    %  852  |   7   |   8   |   9   |
    %  941  |   *   |   0   |   #   |
    %--------------------------------

    switch(freq)
        case(1209+697)
            character = '1';
        case(1336+697)
            character = '2';
        case(1477+697)
            character = '3';
        case(1209+770)
            character = '4';
        case(1336+770)
            character = '5';
        case(1477+770)
            character = '6';
        case(1209+852)
            character = '7';
        case(1336+852)
            character = '8';
        case(1477+852)
            character = '9';
        case(1209+941)
            character = '*';
        case(1336+941)
            character = '0';
        case(1477+941)
            character = '#';
        otherwise
            character = 'x';
    end
end

