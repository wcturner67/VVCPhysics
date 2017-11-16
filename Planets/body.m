classdef body
    properties (Access = public)
        x(1, 1) double
        y(1, 1) double
        z(1, 1) double
        v(3, 1) double
    end
    
    methods (Access = public)
        % Constructor
        function obj = body(x, y, v, z)
            % Input validation
            [~, lengths] = cellfun(@size, {x, y, v, z});
            lengthCheck = lengths == lengths';
            if any(lengthCheck(:))
                error('Length mismatch')
            end
            
            obj(1:lengths(1)) = obj;
            % 
            for k = 1:lengths(1)
                obj(k).x = x(k);
                obj(k).y = y(k);
                obj(k).z = z(k);
                obj(k).v = v(:, k);
            end
        end
    end
    
    methods (Access = private)
        
    end
end