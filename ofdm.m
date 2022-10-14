
ip = rand(1,N)>0.5;
ip_grouped = reshape(ip,[(size(ip,2)/2),2]);
for ii = 1:(size(ip,2)/2)
    switch(ip_grouped(ii,:))
        case [0,0]
            s(ii)= -(1/sqrt(2))-(1j/sqrt(2));
        case [0,1]
            s(ii)= -(1/sqrt(2))+(1j/sqrt(2));
        case [1,0]
            s(ii)= (1/sqrt(2))-(1j/sqrt(2));
        case [1,1]
            s(ii)= -(1/sqrt(2))+(1j/sqrt(2));
    end
end