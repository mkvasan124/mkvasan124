clear all
clc

w=[0,pi/4,pi/2,pi,3*pi/2,];
n=0:30;
n_scale=0:31;
for i=1:length(w)
    x(i,:)=cos(w(i)*n);
    figure()
    stem(n,x(i,:));
end
