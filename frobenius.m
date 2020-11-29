function [value] = frobenius(M,X)
value=0;
for i=1:size(X,1)
    for j=1:size(X,2)
        if(X(i,j)>0)
            value=value+ abs(M(i,j)-X(i,j))^2;
        end
    end
end
value=value^(0.5)/nnz(X);
end

