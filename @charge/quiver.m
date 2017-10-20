function hand = quiver(Q, x, y, varargin)
% CHARGE/QUIVER Overloads the quiver plot function to work with charge 
% vector inputs

numQ = length(Q);

% Calculate E-Field vectors
u = zeros(1, length(x)); v = u;
if isvector(x) || isvector(y)
    [x, y] = meshgrid(x, y);
end
for k = 1:numQ
    [ut, vt] = EField(Q(k), x, y);
    u = u+ut;
    v = v+vt;
end

% Plot vectors
hand = quiver(x, y, u, v, varargin{:});

% Add positive charges
hold on
pos = Q([Q.mag] > 0);
line([pos.x], [pos.y], 'Color', 'g', 'Marker', '+', 'LineStyle', 'none')

% Add negative charges
neg = Q([Q.mag] < 0);
line([neg.x], [neg.y], 'Color', 'r', 'Marker', 'x', 'LineStyle', 'none')
hold off

% Clear handle if not requested
if nargout == 0
    clear hand
end
end