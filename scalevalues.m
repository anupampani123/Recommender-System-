function [Mnew] = scalevalues(M)
%M is the input matrix whose values are to be scaled
%ratings need to be modified so that the values are in range 1:5


for i=1:size(M,1)
    
    for j=1:size(M,2)
        if(M(i,j) <1)
            M(i,j)=1;
        else if(M(i,j)>5)
                M(i,j)=5;
            else 
                M(i,j)=round(M(i,j));
            end
        end
    end
   
end
Mnew=M;
end

