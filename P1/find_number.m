function [Y] = find_number(DTMF)

A=1;

frequencies = [697, 770, 852, 941, 1209, 1336, 1477];
L=300;
B=ones(1, L).*(1/L);

threshold=0.8;

data=[];
for i=DTMF
    if(i==0)
        continue
    end
    data(end+1)=i;
end

toneList=zeros(1600, length(data)/1600);

k=1;
j=1;

%%Convert to several arrays of tones
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
            B1(end+1)=2*B(n)*cos(2*pi*j*n/8000);
        end
        [H, w]=freqz(B1, A, L);
        plot(w*8000/(2*pi), abs(H));
        hold on;
        
        y=filter(B1, A, toneList(:, i));
        if(max(y)>threshold)
            validFrequencies(end+1)=j;
            validFrequencies
        end
    end
    numbers(end+1)=freq2char(sum(validFrequencies));
end
numbers=char(numbers);
Y=numbers;
end

