classdef cartesian
    properties
        x(1, 1) double {mustBeFinite}
        y(1, 1) double {mustBeFinite}
        z(1, 1) double {mustBeFinite}
    end
    
    methods
        % Constructor
        function obj = cartesian(x, y, z)
            % Input validation
            numX = length(x); numY = length(y); numZ = length(z);
            if any(numX ~= [numY numZ]) || numY ~= numZ
                error('Input length mismatch')
            end
            
            for k = numX:-1:1
                obj(k).x = x;
                obj(k).y = y;
                obj(k).z = z;
            end
        end
    end
end