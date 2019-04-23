function [path]=bcdPath2(sR,eR,sC,eC,dist)
flag=0;
path=[];
iter=((eR-sR)+1)/2;
Rows=(eR-sR)+1;
LSc=length(sC);
LEc=length(eC);

if(Rows~=LSc)
    fprintf("\n The num of Rows and Length of Col P of 1 not equal in Row %d",sR)
end

if(sR>1)
    int=(sR-1);
    loc=ones(int,1);
    sC=[loc;sC];
    eC=[loc;eC];
end
    eR
for i =sR:dist:eR
    
    if(flag==0)
        for j=sC(i,1):eC(i,1)
            path=[path;j,i];
        end
        flag=1;
        
    elseif(flag==1)
        
        for j=eC(i,1):-1:sC(i,1)
            path=[path;j,i];
        end
        flag=0;
        
        
    end
end
            
            
