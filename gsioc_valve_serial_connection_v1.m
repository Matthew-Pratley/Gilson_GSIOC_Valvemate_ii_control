function [s_connect, message] = gsioc_valve_serial_connection_v1(port);
% function for connecting to a Gilson pump or actuator depending on the device connected to the computer using a GSIOC cable

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
% ports - this is the comport you want to make a disconnection or connection to 
% baud - baudrate for the device for: valve selectors  - 19200
%
% Output:
% s_connect - the connection or disconnection of the serial port
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% no imput assumes the connection is to port 1
if nargin ==0
    port = 'Com1';
end

% creates serial connection
s_connect = serialport(port, 19200);
set(s_connect, 'DataBits', 8, 'StopBits', 1, 'Parity', 'even', 'FlowControl', 'none', 'Timeout', 0.5);
configureTerminator(s_connect, 'LF');
configureCallback(s_connect, 'off'); 

% opens the serial connection 
fopen(s_connect)

% reads data from valve 
%valveinfo =gsiocserialinput_v1(s_connect, 'I', 'P');

% writes message 
message = append('Connected to: ', port, ' at ', datestr(now));
disp(message);


end
