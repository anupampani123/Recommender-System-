% X1 and X2 assignment 
% row wise assignment such that each row has one non zero entry
% column wise assignment such that each column has one non zero entry
% after each assignment, change non zero entry in the copy
% of original matrix to 0 this is to ensure that the intersection of the
%two obtained matrices is a null set

R=X;

for i=1:size(R,1)
    nz_col= find(R(i,:));
    col= randi(length(nz_col));
    X1(i,nz_col(col))= R(i,nz_col(col));
    R(i,nz_col(col))=0;
    nz_col(col)=[];
    col=randi(length(nz_col));
    X2(i,nz_col(col))= R(i,nz_col(col));
    R(i,nz_col(col))=0;
    nz_col(col)=[];
    
  
end

for i=1:size(R,2)
    nz_row=find(R(:,i));
    row=randi(length(nz_row));
    X1(nz_row(row),i)=R(nz_row(row),i);
    R(nz_row(row),i)=0;
    nz_row(row)=[];
    row=randi(length(nz_row));
    X2(nz_row(row),i)=R(nz_row(row),i);
    R(nz_row(row),i)=0;
    nz_row(row)=[];
    
end


for i=1:size(R,1)
    nz_col=find(R(i,:)); 
    while( length(nz_col)>1)
         col= randi(length(nz_col));
         X1(i,nz_col(col))= R(i,nz_col(col));
         nz_col(col)=[];
         if(isempty(nz_col))
             break;
         end
         col= randi(length(nz_col));
         X2(i,nz_col(col))= R(i,nz_col(col));
         nz_col(col)=[];
         if(isempty(nz_col))
             break;
         end
    end
    if(~isempty(nz_col))
        if(nnz(X2)< nnz(X1))
             X2(i,nz_col(1))= R(i,nz_col(1));
        else
             X1(i,nz_col(1))= R(i,nz_col(1));
        end
    end
end

            
         
         
             
        
        
       
        
    







    
    
    