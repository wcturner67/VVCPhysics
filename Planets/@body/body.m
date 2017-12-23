classdef body
    % A class that is meant to serve as the basis for a simple model of
    % celestial motion.
    
    %% General properties
    properties
        mass(1, 1) double
        pos cartesian
        vel cartesian
    end
    
    %% General methods
    methods
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
            pos = num2cell(pos); vel = num2cell(vel);
            obj(1:numBodies) = obj;
            for k = 1:numBodies
                % Masses
                obj(k).mass = mass(k);
                
                % Positions
                obj(k).pos = cartesian(pos{k, :});
                
                % Velocities
                obj(k).vel = cartesian(vel{k, :});
            end
        end
    end
    
    %% Private methods
    methods (Access = private)
        body = posUpdate(body)
    end
end