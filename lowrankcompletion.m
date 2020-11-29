function [M,RMSE_hold,RMSE,iterations] = lowrankcompletion(X,r,max_iter)
%matrix completion function
%X is the incomplete matrix, r is the rank to be used 
%max_iter is max iterations, M is the final matrix obtained
RMSE_hold=realmax;
[n1,n2]=size(X);
U=randi([1,5],[n1,r]);
V=zeros(r,n2);
for j=1:n2
    row_indices{j}=find(X(:,j));
end

for i=1:n1
    column_indices{i}= find(X(i,:));
end


for k=1:max_iter
    for j=1:n2
        V(:,j)=(( U(row_indices{j},:)'*U(row_indices{j},:))) \ U(row_indices{j},:)'*X(row_indices{j},j);
    end
    
    for i=1:n1
        U(i,:)= ((( V(:,column_indices{i})*V(:,column_indices{i})'))\ V(:,column_indices{i})*X(i,column_indices{i})')';
    
    end  
    
    test=U*V;
    test=scalevalues(test);
    RMSE(k)=frobenius(test,X);
    iterations(k)=k;
    
    if( RMSE(k)< RMSE_hold)
        U_hold=U;
        V_hold=V;
        M_hold=U_hold*V_hold;
        M_hold=scalevalues(M_hold);
        RMSE_hold=double(RMSE(k));
    end
    
    
end
M=M_hold;
end

