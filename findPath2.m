function [p,l]=findPath(A,idx,no_of_cells,sidy,eidy,dist)
p=cell(no_of_cells,1);
d=cell(no_of_cells,1);
l=[];
m=[];
k=1;
for i=1:size(A,1)
    l(i,1)=length(sidy{i});
    m(i,1)=length(eidy{i});
end

% for i=1:size(idx,1)
%     
%     for j=1:l(i,1)
%         StartC[k,:]=[cellfun(@(x) x(1,j), a(RowsToSelect))]'
%     end
% end

for i=1:size(idx,1)-1
    for j=1:l(idx(i))
        StartC=[cellfun(@(x) x(1,j), sidy(idx(i):(idx(i+1)-1)))];
        EndC=[cellfun(@(x) x(1,j), eidy(idx(i):(idx(i+1)-1)))];
        fprintf("\n Row %d and Column %d",i,j)
        fprintf("\n Len of sC and eC are %d and %d",length(StartC),length(EndC))
        eR=idx(i+1)-1;
        sR=idx(i);
        NR=eR-sR+1;
        fprintf("\n Length of Rows %d",NR)
        p{k,1}=bcdPath2(idx(i,1),idx(i+1,1)-1,StartC,EndC,dist);
        k=k+1;
    end
end
end