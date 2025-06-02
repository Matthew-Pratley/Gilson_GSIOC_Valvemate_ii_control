%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script gives example inputs of every function used to control the
% Gilson Valvemate ii via GSIOC connection
% These functions have been tested as of 30/05/2025 and all work.
% 
% For any issues with any functuions please check the read me sheet within the folder. 
% For further questions on how to use the functions please contact me.
%
% Written by: Matthew Pratley
% Date 30/05/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Serial connection 

% With no comport (assumes 'COM1')
valve = gsioc_valve_serial_connection_v1();

% For any comport that is not 1 for example comport 3

valve = gsioc_valve_serial_connection_v1('COM3');


%% valve reset and home for a valve with ID 34

% resets the connected valve with ID 34 to the home position and wipes memory
gsioc_valve_reset_v1(valve, 34);

%% valve error clear for a valve with ID 34

% clears any errors which appear on the valve
gsioc_valve_error_clear_v1(valve, 34); 


%% set and read the valve position with a valve ID of 34

% reads valve position
gsioc_valve_position_v1(valve, 34, 'read');

% sets a new valve position
gsioc_valve_position_v1(valve, 34, 5);





