function hand = quiver(charge, x, y, varargin)
% CHARGE/QUIVER Overloads the quiver plot function to work with charge 
% vector inputs

numQ = length(charge);

% Calculate E-Field vectors
u = zeros(1, length(x)); v = u;
for k = 1:numQ
    [ut, vt] = EField(charge(k), x, y);
    u = u+ut;
    v = v+vt;
end

% Plot and return handle
hand = quiver(x, y, u, v, varargin{:});
if nargout == 0
    clear hand
end
end