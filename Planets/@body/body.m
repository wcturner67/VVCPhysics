classdef body
    properties (Access = public)
        pos(1, 3) double
        vel(1, 3) double
    end
    
    properties (Access = private)
        acc(1, 3) double
    end
    
    methods (Access = public)
        % Constructor
        function obj = body(pos, vel, r)
            % Input validation
            
        end
    end
    
    methods (Access = private)
        posNew = posUpdate(body)
    end
end