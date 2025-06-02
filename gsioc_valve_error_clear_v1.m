function [message] = gsioc_valve_error_clear_v1(s_connect, ID);
%% Clears an error from the gilson Valvemate ii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
% s_connect - this is the comport that the valve is in
% ID - the ID of the valve itself
% 
% Output:
% outcome - will be a message in the command line as to whether the error is cleared or not
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% creates a position variable 

% reads error information from the valve
valveerrorinfo = gsiocserialinput_v1(s_connect, ID, 'I', 'e');
valveerrorinfo = str2num(valveerrorinfo);

errorcodes = ["Unknown command, please check input values", "Invalid NV-RAM address, please check settings", "Move while busy, please try input again", "Positioning error, please reposition valve", " Invalid command parameter, please check input values", "Homing error, please rehome valve", "Move while unhomed, please rehome valve", "Invalid setting, please check settings"];

%%
if valveerrorinfo == 0;
    message = ('No error Detected')
    disp(message);
else 
    gsiocserialinput_v1(s_connect, ID, 'B', 'e');
    disp(append('Error Code: ', num2str(valveerrorinfo), ' : ',  errorcodes(:, valveerrorinfo)));
    message = append('Error Code: ', num2str(valveerrorinfo), ' cleared');
    disp(message);
end 
end




