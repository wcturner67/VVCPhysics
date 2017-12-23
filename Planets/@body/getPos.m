function posM = getPos(obj)
% 
% 
num = length(obj);
posM = zeros(num, 3);
for k = 1:num
    posM(k, :) = obj(k).pos.vector;
end
end