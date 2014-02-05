valid_numbers=[1,2,3,4,5,6,7,8,9,0];
valid_chars=['*', '#'];

lower_frequencies = [697, 770, 852, 941];
upper_frequencies = [1209, 1336, 1477];

Fs=8000;
time=0.2;
delay=0.05;

piss = input('Skriv inn piss', 's');

lower=0;
upper=0;

for number=piss
    number=str2num(number)
    if(isempty(number))
        disp('Not a number, ignoring');
        continue
        
    end
    switch mod(number, 3)
        case 0
            upper=upper_frequencies(3);
        case 1
            upper=upper_frequencies(1);
        case 2
            upper=upper_frequencies(2);
    end
    
    switch number
        case {1,2,3}
            lower=lower_frequencies(1);
        case {4,5,6}
            lower=lower_frequencies(2);
        case {7,8,9}
            lower=lower_frequencies(3);
    end
    t=0:1/Fs:time;
    xLower=sin(2*pi*lower*t);
    xUpper=sin(2*pi*upper*t);
    sound(xUpper+xLower, Fs);
    pause(delay+time);
end
