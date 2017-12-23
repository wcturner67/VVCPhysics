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
            
            obj(1:numX) = obj;
            for k = 1:numX
                obj(k).x = x(k);
                obj(k).y = y(k);
                obj(k).z = z(k);
            end
        end
        
        function vec = vector(obj)
            vec = [obj.x, obj.y, obj.z];
        end
    end
end