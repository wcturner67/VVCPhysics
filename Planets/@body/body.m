classdef body
    % A class that is meant to serve as the basis for a simple model of
    % celestial motion.
    
    %% General properties
    properties
        mass(1, 1) double
    end
    
    %% Dependent properties
    properties (Dependent = true)
        pos
        vel
    end
    
    %% Private properties
    properties (Access = private)
        posX(1, 1) double {mustBeFinite}
        posY(1, 1) double {mustBeFinite}
        posZ(1, 1) double {mustBeFinite}
        velX(1, 1) double {mustBeFinite}
        velY(1, 1) double {mustBeFinite}
        velZ(1, 1) double {mustBeFinite}
    end
    
    %% General methods
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
        
        %% Constructor method
        function obj = body(mass, pos, vel)
            % BODY creates a celestial body object based on initial mass,
            % position, and velocity data.
            % 
            % Mass must be a scalar or N-length vector, pos and vel should
            % be N x 3 matrices
            
            % Input validation
            [numBodies, ~] = size(pos);
            [numVel, ~] = size(vel);
            numMass = length(mass);
            if numVel ~= numMass || any(numBodies ~= [numVel numMass])
                error('Input size mismatch')
            end
            
            % Move input data into output object
            
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
    end
    
    %% Private methods
    methods (Access = private)
        body = posUpdate(body)
    end
end