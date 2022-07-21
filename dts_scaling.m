clear all
close all
clc

n=-10:1:9;
for i=1:length(n)
    if(n(i)>=5)
       x_n(i)=1; 
    else if (n(i)<=-5)
            x_n(i)=1;
        else
            x_n(i)=2;
        end
    end
end
intp=input('enter interpolation factor');
decm=input('enter decimation factor');

% n_exp=n/exp;
% n_comp=n.*comp;

for i=1:length(n)
    if(decm*i)>20 
        y_n_decm(i)=0;
    else
        y_n_decm(i) = x_n(decm*(i));
    end
end

for i=1:(intp*length(n))    
    if(mod(i,intp)==0)
        y_n_intp(i)=x_n(i/intp);
    else
        y_n_intp(i)=0;
    end
end

figure()
stem(n,x_n,'rs');
hold on
stem(n,y_n_decm,'go');
stem(y_n_intp,'bx');
hold off
axis([-11 11 -1 3])
legend('original signal','decimated version','interpolated version')
xlabel('n')
ylabel('y[n]')
title('discrete time scaling')

figure()
subplot(3,1,1)
n=-10:1:9;
stem(n,x_n);
axis([-11 11 -1 3])
xlabel('n')
ylabel('y[n]')
title('original signal')

subplot(3,1,2)
y_n_trunc=nonzeros(y_n_decm);
stem([-4:5],y_n_trunc');
xlabel('n')
ylabel('y[n]')
title('decimated signal')

subplot(3,1,3)
stem([-19:20],y_n_intp);
xlabel('n')
ylabel('y[n]')
title('interpolated signal')
    

