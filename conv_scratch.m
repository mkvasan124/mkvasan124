clear all
close all
x=input('Enter x:   ')
h=input('Enter h:   ')
m=length(x);
n=length(h);
X=[x,zeros(1,n)]; 
H=[h,zeros(1,m)]; 
for i=1:n+m-1
    conv_sum(i)=0;
    for j=1:m
        if(i-j+1>0)
            conv_sum(i)=conv_sum(i)+X(j)*H(i-j+1);
        end
    end
end
conv_inbuilt=conv(X,h);

