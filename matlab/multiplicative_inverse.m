function y=multiplicative_inverse(x,p)

k=zeros(size(x));   
m=mod(k*p+1,x);     
while sum(m)        
    k=k+sign(m);  
    m=mod(k*p+1,x);
end
y=(k*p+1)./x; 