clear all
reg_content = [1,0,0];
ip_seq = [1,1,0,1,1];
i=length(ip_seq);
while(i)
  pointer=6-i;
  current_state=reg_content(1:2);
%   temp1=reg_content(1);
%   temp2=reg_content(2);
  reg_content(1)=ip_seq(pointer);
  reg_content(:,2:3)=current_state;
%   reg_content(2)=temp1;
%   reg_content(3)=temp2;
  next_state(pointer,:)=reg_content(:,1:2);
  op(pointer,:)= [(xor(reg_content(1),reg_content(2))),(xor(reg_content(2),reg_content(3)))];
  i=i-1;  
end     