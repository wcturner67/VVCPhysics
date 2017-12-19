classdef body
    %%
    properties
        mass(1, 1) double
    end
    %%
    properties (Dependent = true)
        pos
        vel
    end
    %%
    properties (Access = private)
        posX(1, 1) double {mustBeFinite}
        posY(1, 1) double {mustBeFinite}
        posZ(1, 1) double {mustBeFinite}
        velX(1, 1) double {mustBeFinite}
        velY(1, 1) double {mustBeFinite}
        velZ(1, 1) double {mustBeFinite}
    end
    
    methods
        %% Get methods
        function pos = get.pos(obj)
            pos = struct('x', obj.posX, 'y', obj.posY, 'z', obj.posZ);
        end
        
        function vel = get.vel(obj)
            vel = struct('x', obj.velX, 'y', obj.velY, 'z', obj.velZ);
        end
        
        %% Set methods
        function obj = set.pos(obj, new)
            obj.posX = new(1);
            obj.posY = new(2);
            if length(new) == 3
                obj.posZ = new(3);
            end
        end
        
        function obj = set.vel(obj, new)
            obj.velX = new(1);
            obj.velY = new(2);
            if length(new) == 3
                obj.velZ = new(3);
            end
        end
    end
    
    methods
        %% Constructor method
        function obj = body(mass, pos, vel)
            %
            %
            
            % Input validation
            if any(size(pos) ~= size(vel))
                error('Input size mismatch')
            end
            
            % Move input data into output object
            [numBodies, ~] = size(pos);
            obj(numBodies) = obj;
            for k = 1:numBodies
                % Masses
                obj(k).mass = mass(k);
                
                % Positions
                obj(k).pos = pos(k, :);
                
                % Velocities
                obj(k).vel = vel(k, :);
            end
        end
        
        %%
    end
    
    methods (Access = private)
        body = posUpdate(body)
    end
end