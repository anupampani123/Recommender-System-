data=importdata('ml-100k/u.data');
data= data(:,1:3);
user_id=data(:,1);
item_id=data(:,2);
X=zeros(length(unique(item_id)),length(unique(user_id)));
for i=1:length(data)
    X(item_id(i),user_id(i))=data(i,3);
end

for i=1:length(unique(item_id))
    if( nnz(X(i,:)) < 2 ) 
        len= find(X(i,:));
             for j=1:length(len)
                 X(i,len(j))=0;
             end
    end
end
X(all(X == 0, 2), :) = [];     
X1=zeros(size(X));
X2=zeros(size(X));








