function y=mydelta(t)
y=zeros(1,length(t));
for i=1:length(t)
    if t(i)==0
        y(i)=1000;
    else 
        y(i)=0;
    end
end