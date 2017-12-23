classdef body
    % A class that is meant to serve as the basis for a simple model of
    % celestial motion.
    
    %% General properties
    properties
        mass(1, 1) double
        rad(1, 1) double
        pos cartesian
        vel cartesian
    end
    
    %% General methods
    methods
        %% Constructor method
        function obj = body(mass, rad, pos, vel)
            % BODY creates a celestial body object based on initial mass,
            % position, and velocity data.
            % 
            % Mass must be a scalar or N-length vector, pos and vel should
            % be N x 3 matrices
            
            % Input validation
            numBodies = size(pos, 1);
            numVel = size(vel, 1);
            numMass = length(mass);
            if any(numBodies ~= [numVel numMass])
                error('Input size mismatch')
            end
            
            % Move input data into output object
            obj(1:numBodies) = obj;
            cartPos = cartesian(pos(:, 1), pos(:, 2), pos(:, 3));
            cartVel = cartesian(vel(:, 1), vel(:, 2), vel(:, 3));
            for k = 1:numBodies
                % Masses
                obj(k).mass = mass(k);
                
                % Diameters
                obj(k).rad = rad(k);
                
                % Positions
                obj(k).pos = cartPos(k);
                
                % Velocities
                obj(k).vel = cartVel(k);
            end
        end
        
        %% Position/velocity matrix get methods
        posM = getPos(body)
        velM = getVel(body)
        
        %% Update method
        obj = update(obj)
    end
end