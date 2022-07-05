clc
clear
A=input('Enter the coefficient matrix A: \n');
% A=[4 3 5; 1 6 3; 5 7 3]; Write the coefficient matrix, A. 
%where the system :AX=B.
B=input('Enter the constant matrix B: \n');
% B=[3; 4; 7]; Write the constants matrix, B
P=[ A B ]; % constructing the new augmented matrix P 
[row,col ] = size(P); % Calculating the size of augmented matrix, P   
for m = 1:row % checking whether diagonal elements are all non-zeros or not
    if P(m,m) == 0 
       disp('Gauss elimination method can not applicable. Rearrange the equations!!!');
       %Diagonal element zero. Hence pivote can't be calculated.
       return
    end
 end
for m = 1:row-1 % Finding zeros of lower triangular matrix.
    a=P(m,m);  
     P(m,:)= P(m,:)/a;
    for k=m+1:row     
      P(k,:)= P(k,:)- P(k,m)* P(m,:);
    end
end
 a=P(row,row);  
 P(row,:)= P(row,:)/a;
 s=0;
for m=row:-1:2 %Finding the final solutions
    for k=m+1:col
        s=s+P(m-1,k-1)* P(k-1,col);
        P(m-1,col)= P(m-1,col)- s; 
        s=0;
    end
end
  disp('The required solution is:')
  disp(P(:,col));
  %fprintf('%1.5f \n', P(:,col)); 
  