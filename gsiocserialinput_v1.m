function output = gsiocserialinput_v1(s,ID,stype,command)

% ID for device
IDnum = ID + 128;

%initiate operation by sending IDnum to device
out = gsiocserialinputcheck_v1(s,IDnum); 
pause(0.1)
out = gsiocserialinputcheck_v1(s,IDnum);

if stype == 'I'
    
    %counter for storing responses
    counter1 = 1; 
    
    % write command to actuator
    fwrite(s, command);
    
    % reads response from actuator
    response(counter1) = fread(s,1);
    
    % whilst waiting for a response from the actuator
    while response(counter1) < 128
        
        % asks for next byte of data with 'ack'
        fwrite(s, char(6)) 
        
        %reads 1 byte at a time
        response(counter1 + 1) = fread(s, 1); 
        
        % counts the responses and reads
        counter1 = counter1+1;  
    end
    
    % modifies the last byte and converts it into ASCII - Akien
    output = char([response(1:end - 1), response(end) - 128]);
    
elseif stype == 'B' 
    
    % Initiate transmission with a LF
    out = gsiocserialinputcheck_v1(s,newline);  
    
    % Send bytes one at a time
    for i = 1:numel(command)  
        out(i) = gsiocserialinputcheck_v1(s,command(i));
    end
     % Terminate transmission with a CR
    out2 = gsiocserialinputcheck_v1(s,char(13));  
    
    %check that the returned signal matches the command
    if out ~= command  
        output = 'fail';
        disp(['Sent: ',command,' Received ',out])
    else
        output = 'ok';
    end
end

