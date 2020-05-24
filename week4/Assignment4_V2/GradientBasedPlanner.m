function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);

%%% All of your code should be between the two lines of stars.
% *******************************************************************
%route = 0;
%Init the route, add the start_coords
route = [];
route(1, :) = start_coords;

%current_position will keep track of where we're currently at for
%reference. Initialize it at the start.
current_position = start_coords;

%Calculate max step size
step = sqrt(gx .^ 2 + gy .^ 2);

%Normalize gx/gy so it's not over 1
gx = gx ./ step;
gy = gy ./ step;

%Our iteration will go until max iterations have been surpassed.
%If we reach within a certain distance of the goal, then we'll
%exit then.
for iteration = 1:max_its
    
    % Take our step
    new_X = current_position(1) + gx(round(current_position(2)), round(current_position(1)));
    new_Y = current_position(2) + gy(round(current_position(2)), round(current_position(1)));
    
    if round(new_X) <= size(f, 2) && round(new_X) >= 1
       current_position(1) = new_X; 
    end
    if round(new_Y) <= size(f,1) && round(new_Y) >= 1
       current_position(2) = new_Y; 
    end
   
    %Append this move to our route
    route(iteration +1, :) = current_position;
    
     
    %Find our distance to the goal to see if we should stop
    distance_from_goal = sqrt( (current_position(1)-end_coords(1))^2 + (current_position(2) - end_coords(2))^2 );
    
    % If we've hit our goal distance from the end (2.0 or less) then we're
    % done!
    if distance_from_goal < 2.0
       return; 
    end
    
end

% *******************************************************************
end
