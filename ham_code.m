clear all
G = input('enter the generator matrix');
m = input('enter the 4 bit message');
disp('generated codeword')
C = mod((m*G),2)
n = size(C,2);
P = G(:,5:7);
identity_H = eye(3);
H = cat(1,P,identity_H);
disp('errorfree syndrome')
S = mod((C*H),2)
e = input('enter the position of array')
error = dec2bin((2^e),7); 
for i = 1:length(error)
    array_error(i) = str2num(error(i));
end
C_error = xor(C,array_error);
S_error = mod((C_error*H),2)

for i = 1:7
    if(H(i,:)) == S_error
        errored_bit_position = i
    end
end

C_corrected = C_error;
C_corrected(errored_bit_position) = (~C_corrected(errored_bit_position));
disp('Corrected Codeword')
C_corrected
