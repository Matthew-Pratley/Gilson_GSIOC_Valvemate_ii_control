function out = gsiocserialinputcheck_v1(s,command)

% send a command
% check that the response matches the byte sent
% if they do not match then attempt to re-send and check

try
    % clear buffer if data is available
    if s.BytesAvailableFcnCount   > 0; 
        %bufferread = read(s,s.BytesAvailableFcnCount);
    end
    % Write to device
    fwrite(s,command);

    % read from the device
    out = fread(s,1);
catch
    % clear buffer if data is available
    if s.BytesAvailableFcnCount> 0; 
        %bufferread = read(s,s.BytesAvailableFcnCount);
    end
    % Write to device
    fwrite(s,command);

    % read from the device
    out = read(s,1);
end

% check for match of bytess
if command ~= out  %check for match of bytess
    disp(['output: ',out,' does not match command: ',command])
end

end