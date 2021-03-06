function [cout, hand] = contour(Q, x, y, varargin)
% CHARGE/CONTOUR Overloads countour plotting to plot the potential
% generated by point charges defined by charge vector Q

numCharges = length(Q);
k = 8.987551787368e9;

% Reshape charge magnitudes to be along 3rd dimension so calculation
% implicitly expands
chargevec = reshape([Q.mag], 1, 1, numCharges);

% Calculate potential
V = sum(k.*chargevec./sqrt(x.^2+y'.^2), 3);

% Draw map and return handles
[cout, hand] = contour(x, y, V, varargin{:});
if nargout == 1
    clear hand
end
end