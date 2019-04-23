clc
clear all
A= imread('tmp0.png');
try
    A=rgb2gray(A);
    A=im2bw(A);
catch
    A=im2bw(A);
end

x=zeros(size(A,1),1);
sidy=cell(size(A,1),1);
eidy=cell(size(A,1),1);
idy=[];
for i=1:size(A,1)
    [x(i),sidy{i,1},eidy{i,1}]=rowFreeSpace(A(i,:));
end

[idx,no_of_cells]=FindCell(x,A);

dist=15;
path=findPath2(A,idx,no_of_cells,sidy,eidy,dist);
%A(idx,:)=0;
imshow(A)
hold on
for i=1:size(path,1)
    plot(path{i,1}(:,1),path{i,1}(:,2),'blue')
end
datacursormode

