%get a device
h = haptikdevice;

%run simulation for 20 seconds
tic
while toc < 360
    
    %read probe position
    pos = read_position(h)
    
    %check for collision and send back force feedback
%     if pos(2)<0
%         write(h, -1 * [0 pos(2) 0]);
%     else
%         write(h,[0 0 0]);
%     end
    
    force = [0 0 0];   %Need to find range of accepted forces
    ff = 10;
    boxsize = 10;
    
    % on left side
    if pos(1)> -boxsize & pos(1) < 0  
        ff = pos(1) + boxsize
        force = force + [-ff 0 0];
    end
    % on right side
    if pos(1)< boxsize & pos(1) > 0  
        ff = pos(1) - boxsize
        force = force + [ff 0 0];
    end
    
    %on top side
    if pos(2)< boxsize & pos(2) > 0  
        ff = pos(1) - boxsize
        force = force + [0 ff 0];
    end   
    %on bottom side
    if pos(2)> -boxsize & pos(2) < 0  
        ff = pos(1) + boxsize
        force = force + [0 -ff 0];
    end 
    
   %on front side
    if pos(3)< boxsize & pos(3) > 0  
        ff = pos(1) - boxsize
        force = force + [0 0 ff];
    end 
   %on front side
    if pos(3)> -boxsize & pos(3) < 0  
        ff = pos(1) + boxsize
        force = force + [0 0 -ff];
    end     
    
    
   write(h,force) 
end

close(h);
clear h

