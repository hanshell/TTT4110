%% TTT4110 Project - Part 2
% This part of the project will focus on decoding a signal and convert the
% frequencies to numbers and characters. Part 1 was encoding a signal,
% while part 2 is decoding a similar signal. 



%% Frequency to character conversion
% The frequency to character convertion is added as a separate function
% called freq2char(). The function takes inn the sum of two frequencies and
% returns the corresponding character.
%
% For more information: freq2char.m



%% Find Number - Time-Domain
% Function takes in an DTMF signal and returns the digits given by the
% input signal.

function [Y] = find_number(DTMF)

A=1;

frequencies = [697, 770, 852, 941, 1209, 1336, 1477]; 
L=300; % Filter bandwidth
B=ones(1, L).*(1/L); % Array of filter-cofficients 

threshold=0.2;


data=[]; % Liste for å lage alle signalene, uten pauser


% Removes pauses between the signals in the input
for i=DTMF
    if(i==0)
        continue
    end % End of IF
    data(end+1)=i;
end % End of FOR-loop


toneList=zeros(1600, length(data)/1600); % 2-dimentional array to hold the individual tones.

k=1;
j=1;

% Convert signal to several arrays of tones 
for i=1:length(data)
    toneList(j, k)=data(i);
    if(mod(i, 1600)==0)
        j=0;
        k=k+1;
    end
    j=j+1;
end

numbers=[]; %List of numbers detected in signal

for i=1:length(toneList(1, :))
    validFrequencies=[];
    for j=frequencies
        B1=[];
        for n=1:L
            B1(end+1)=2*B(n)*cos(2*pi*j*n/8000); % Adds the new filter coffiecients, based on the current frequency in the for-loop.
        end

        y=filter(B1, A, toneList(:, i)); % Sends the signal through the filter, to filter out valid frequencies.
        if(max(y)>threshold) % Checks if the signal is within the threshold.
            validFrequencies(end+1)=j; % Adds the frequency to the list of valid frequencies.
            validFrequencies
        end
    end
    numbers(end+1)=freq2char(sum(validFrequencies)); % Translates the sum of the frequency-pair into a character/valid digit
end

numbers=char(numbers); % Converts the digits from ASCII to characters.
Y=numbers; % Returns the list of valid digits.
end

