function [y] = flujog(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

M1 = 0;
M2 = 0;
M3 = 0;

for i = 1:length(x)
    
    X = x(i)
    
    Y = M3;
    
    A = M1 + 0.25*Y;
    B = 0.25*X + M2;
    
    M1 = X;
    M2 = A;
    M3 = B;
    
    y(i) = Y;
end




end

