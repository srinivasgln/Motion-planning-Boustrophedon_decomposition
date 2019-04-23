function [idx,cell_no]=FindCell(output,A)

idx=[];
cell_no=rowFreeSpace(A(1,:));
% check=0;
% 
% for i=1:size(output,1)
%     if(check==0)&&(output(i)>0)
%         check=1;
%         idx=[idx;i];
%        
%     end
% end

for i=2: size(output,1)
   if  output(i-1)~=output(i)   
       [output1, sidy1,eidy1]=rowFreeSpace(A(i-1,:));
       [output2, sidy2,eidy2]=rowFreeSpace(A(i,:));
       %fprintf("\n The size of c_no is %d * %d",size(c_no,1),size(c_no,2))
       %fprintf("\n The size of output2 is %d * %d",size(output2,1),size(output2,2))
            
       if(output1>output2)
           idx=[idx;i];
           cell_no=cell_no+output2;
           
       elseif(output1<output2)
           idx=[idx;i];
           cell_no=cell_no+output2;
       end
       
   end
   %fprintf("\n The size of final c_no is  %d * %d",size(c_no,1),size(c_no,2))
end
% check=0;
% for i=1:size(output,1)
%    if(output(i,1)>0)&&(check==0)
%        start=i;
%        check=1;
%        
%    end
%    
% end


Check1=0;
Check2=0;
for m=1:size(output,1)
    if(output(m)>0)&&(Check1==0)
        st=m;
        Check1=1;
    end
    if(output(m)>0)
        ed=m;
    end
    
end

if(st~=idx(1))
    idx=[st;idx];
end

if(ed~=idx(length(idx)))
    idx=[idx;ed];
end
end
