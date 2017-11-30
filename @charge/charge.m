classdef charge
    properties
        x(1, 1) double
        y(1, 1) double
        z(1, 1) double
        mag(1, 1) double
    end
    methods (Access = public)
        % Constructor
        function obj = charge(mag, x, y, z)
            % CHARGE creates a charge vector from given magnitude and
            % position vectors
            %
            % All inputs should have SI units and decimation (e.g. 1e-6 to
            % represent micro-coulombs)
            
            % Validate inputs
            num = length(x);
            if nargin == 3
                z = zeros(1, num);
            end
            if any(num ~= [length(mag) length(y) length(z)])
                error('All inputs must be equal length')
            end
            
            % Feed input arguments into output object
            obj(1:num) = obj;
            for k = 1:num
                obj(k).x = x(k);
                obj(k).y = y(k);
                obj(k).z = z(k);
                obj(k).mag = mag(k);
            end
        end
        
        % Graphing overloads
        hand = quiver(charge, x, y, varargin)
        hand = quiver3(charge, x, y, z, varargin)
        [cout, hand] = contour(Q, x, y, varargin)
    end
    
    methods (Access = private)
        % Electric-field calculator
        [u, v, w] = EField(Q, x, y, z)
    end
end