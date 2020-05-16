function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

% There are three sides we have to check.
for i = [1,2,3]
    if i == 1
        p1 = [P1(1,1), P1(1,2)];
        p2 = [P1(2,1), P1(2,2)];
        rp = [P1(3,1), P1(3,2)];
    elseif i == 2
        p1 = [P1(2,1), P1(2,2)];
        p2 = [P1(3,1), P1(3,2)];
        rp = [P1(1,1), P1(1,2)];
    elseif i == 3
        p1 = [P1(3,1), P1(3,2)];
        p2 = [P1(1,1), P1(1,2)];
        rp = [P1(2,1), P1(2,2)];
    end
    
    m = (p2(2) - p1(2)) / (p2(1) - p1(1));
    b = p1(2) - (m * p1(1));
    
    if rp(2) > m*rp(1) + b
       %All of p2 points must be LESS than or we did
       %not find a separating edge
       lessThan = true;
       for i = [1,2,3]
           if P2(i,2) < (P2(i, 1) * m) + b
              continue 
           else
               lessThan = false;
           end
       end
       if lessThan
           % we have found a seperating edge - return
           % false!
           flag = false;
           return
       else
           % This is not a separating edge :-(
           continue
       end
    else
        %All of p2 points must be GREATER than or we did
        %not find a separating edge
       greaterThan = true;
       for i = [1,2,3]
           if P2(i,2) > (P2(i, 1) * m) + b
              continue 
           else
               greaterThan = false;
           end
       end
       if greaterThan
           % we have found a seperating edge - return
           % false!
           flag = false;
           return
       else
           % This is not a separating edge :-(
           continue
       end
    end
end
    
% If we've made it this far, no separating edge was found :-(
flag = true;
% *******************************************************************
end