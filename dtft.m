 clear all
 close all
 clc
 
 x_n=[zeros(1,10),ones(1,10),zeros(1,10)];
 f=-15:14;
 
figure()
stem(x_n)

for i=1:length(x_n)
    for k=1:length(f)
        int1(k,:)=x_n(k).*exp(j*2*pi*f(k)*[1:length(x_n)]);
    end
    x_e_jw(:)=sum(int1);
end

figure()
plot(f,abs(x_e_jw));

