%% TTT4110 Project - Part 2

%% Frequencys
% The frequencys are defined as upper and lower bound frequencys. They will
% be combined later to define the characteristic sinusoidal signal for each
% number and character.
lower_frequencies = [697, 770, 852, 941];
upper_frequencies = [1209, 1336, 1477];
frequencies = [697, 770, 852, 941, 1209, 1336, 1477];

Fs=8000;

%% Frequency to character conversion
% The frequency to character convertion is added as a separate function
% called freq2char(). The function takes inn the sum of two frequencies and
% returns the corresponding character.
%
% For more information: freq2char.m

