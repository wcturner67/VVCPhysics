function velM = getVel(obj)
% 
% 
num = length(obj);
velM = zeros(num, 3);
for k = 1:num
    velM(k, :) = obj(k).vel.vector;
end
end