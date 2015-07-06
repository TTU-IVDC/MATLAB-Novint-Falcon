%get a device
clear all;

h = haptikdevice;

%run simulation for 10 seconds
tic
while toc < 30
    
    %read probe position
    pos = read_position(h);
    
    %send force feedback
    kx = 0.5;
    ky = 0.5;
    kz = 1;

    
    write(h, -1 * [pos(1)*kx pos(2)*ky pos(3)*kz]);

    end
    

close(h);
clear h
 
