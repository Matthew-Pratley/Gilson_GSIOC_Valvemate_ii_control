function [message] = gsioc_valve_position_v1(s_connect, ID, value);
%% sets a gilson valvemate ii to a specific position 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
% s_connect - this is the comport that the valve is in
% ID - the ID of the valve itself
% position - the position you want the valve top be in
%
% Output:
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

text_test = ischar(value);

if text_test == 1;
    if contains(value, 'read');
    % reads information about the valve such as the number of ports and positions
    valveinfo =gsiocserialinput_v1(s_connect, ID, 'I', 'P');

    disp(append('Valve: ', num2str(ID), ' is in position ', valveinfo));

    else
        message = 'Invalid input please make sure the input value is either "read", or a valid number';
        disp(message);
    end

elseif text_test == 0;

    % creates a position variable 
    pos = strcat('P', num2str(value));

    % reads information about the valve such as the number of ports and positions
    valveinfo =gsiocserialinput_v1(s_connect, ID, 'I', 'T');

    % extracts port and position number
    posnum = str2num(valveinfo(3));
    portnum =  str2num(valveinfo(7));


    % catches if the position number input is too high for the valve
    if value > portnum || value > posnum ;
        message = 'Error position value invalid';
        disp(message);
    else 
        gsiocserialinput_v1(s_connect, ID, 'B', pos);
        message = append('Valve:', num2str(ID), ' set to position: ', num2str(value));
        disp(message);
    end

end
end