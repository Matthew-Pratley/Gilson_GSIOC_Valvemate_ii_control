function [outcome] = gsioc_valve_reset_v1(s_connect, ID);
%% sets a gilson valvemate ii to a specific position 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
% s_connect - this is the comport that the valve is in
% ID - the ID of the valve itself
%
% Output: resets the power to valve and homes the position 
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%resets power to device and homes valve
gsiocserialinput_v1(s_connect, ID, 'I', '$');

disp(append('Valve : ', num2str(ID), 'reset'));

end