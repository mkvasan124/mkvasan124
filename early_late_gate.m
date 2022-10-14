s_t=signal_input(20);
figure()
plot(s_t);
corr_op=correlator(s_t);
figure()
plot(corr_op);
comp_op=comparator(corr_op);
figure()
stem(comp_op);
sync = find(any(~comp_op,2));

function [s_t]= signal_input(L)
    r_t=rectwin(L);
    fc=10^3;
    wc=2*pi*fc;
    phi_c=0;
    s_t=r_t*cosd(wc+phi_c);
    return 
end

function[corr_op]=correlator(s_t)
    corr_op=xcorr(s_t);
    return
end

function[comp_op]=comparator(corr_op)
    comp_op = gradient(corr_op,2);
end



