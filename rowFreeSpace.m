function [output,sidy,eidy]=rowFreeSpace(x)
l=length(x);
sidy=[];
eidy=[];
if x(1)==1
    output=1;
    sidy=[1];
else
    output=0;
end

for i=2:l
    if ((x(i-1)==0)& (x(i)==1))
        output=output+1;
        sidy=[sidy,i];
    end
    if((x(i-1)==1)& (x(i)==0))
        eidy=[eidy,i-1];
    end 
    
    if((i==l) & (x(i)==1))
        eidy=[eidy,i];
    end
end
end