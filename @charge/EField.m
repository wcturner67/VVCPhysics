function [u, v, w] = EField(Q, x, y, z)
% EFIELD Calulates the electric field vectors generated at points
% defined by x, y, and z by charge Q


% Input validation
dim = size(x);
if nargin == 3
    z = zeros(dim);
end
inSz = dim ~= [size(y); size(z)];
if any(inSz(:))
    error('Input length mismatch')
end

% Field calculation
r = sqrt((x-Q.x).^2+(y-Q.y).^2+(z-Q.z).^2);
u = 8.99e9*Q.mag*(x-Q.x)./r.^3;
if nargout >= 2
    v = 8.99e9*Q.mag*(y-Q.y)./r.^3;
end
if nargout == 3
    w = 8.99e9*Q.mag*(z-Q.z)./r.^3;
end
end