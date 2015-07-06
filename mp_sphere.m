%get a device
h = haptikdevice;

%run simulation for 20 seconds
tic
while toc < 60
    
    %read probe position
    pos = read_position(h)
    
    %check for collision and send back force feedback
    if pos(2)<0
        write(h, -1 * [0 pos(2) 0]);
    else
        write(h,[0 0 0]);
    end
    
end

close(h);
clear h

