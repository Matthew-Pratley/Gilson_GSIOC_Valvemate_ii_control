Gilson Valvemate ii Control Driver

Written in: MATLAB R2024b
Written by: Matthew Pratley
Date: 23/04/2025
Updated: 30/05/2025


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
General:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
The functions contained control the Gilson Valvemate ii, actuator valves using a GSIOC cable. 
These functions have been built and tested on a 6 port actuator. The functions should be compatible with any number of ports due to the generic way they are written, but this is untested therefore testing of the functions should be completed with other port layouts. 
In all cases valve ID is required, this is set from the back of the valve actuator, if unsure of valve ID please check the user manual for further information on the setting switches at the back of the unit.
For all examples below the comport connected to will be comport 3 as demonstrated in the examples by 'COM3', your comport number maybe different.
All of the functions within can also be viewed in the gsioc_example_input_script.m within this folder. This file can also be used to test the connection to the pump and to determine if the functions are working. 
Last test date: 30/05/2025

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gsiocserialinput_v1.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
This first checks the connection to the valve before formatting the input command into one the valve can understand.
The two types of command it accepts are 'I' for immediate and 'B' for buffered which occurs when the valve actuator has finished what it is doing, the final input is taken from the user manual and is dependant on what the user is attempting to do. Each type of command is written to the valve. This function should not be used as it formats and writes the commands to the pump and it is built into the other functions contained within the folder.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gsiocserialinputcheck_v1.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
This first checks the connection to the valve before checking the pump had understood the input command by clearing and reading the buffer. This reads and compares the command that has been written to the valve, following which the valve is read to form a check that the command has been successful. This function should not be used as it is a catch for sending the commands it is built into the other functions contained within the folder.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Serial connection to valve actuator via GSIOC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Function for connecting to a Gilson Valvemate II actuator using a GSIOC to serial cable. If no comport is specified then the function will automatically assume the comport which the valve is connected to is 'COM1'. The baudrate for the valves is assumed to be set to 19200 in this function but this may not be the case, so for connection errors check the baudrate the device is set to.  

Function: gsioc_serial_connection_v1.m
Generic use:
gsioc_serial_connection_v1('COMPORT'); 

Example:
For comport 1;
gsioc_serial_connection_v1(); 


For known comport
gsioc_serial_connection_v1('COM3');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Reset valve actuator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Function for resetting a Gilson Valvemate II actuator using a GSIOC to serial cable. This sets the valve to home and refreshes the memory clearing everything stored other than the ID which is manually set via the switches as the back of the actuator. This will require a device ID for the reset to be successful.

Function: gsioc_valve_reset_v1.m
Generic use:
gsioc_valve_reset_v1(VALVE, ID); 

Example:
For connect valve with an ID of 34.
gsioc_valve_reset_v1(valve, 34);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Clears errors from the valve actuator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Function for clearing errors from a Gilson Valvemate II actuator using a GSIOC to serial cable. This clears any errors but the valve remains in the position it was previously set to. This will require a device ID for the reset to be successful.

Function: gsioc_valve_error_clear_v1.m
Generic use:
gsioc_valve_error_clear_v1('COMPORT', ID); 

Example:
For connected valve with an ID of 34.
gsioc_valve_error_clear_v1(valve, 34); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Set and read position of the valve actuator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Function for both reading and setting the position of a Gilson Valvemate II actuator using a GSIOC to serial cable. This function is dependent on the input of the valve actuator if the input is 'read' then the output will be a command line statement of the current valve position. If the input is a number (eg: 4) then the valve will be set to that number. 

Function: gsioc_valve_position_v1.m
Generic use:
gsioc_valve_position_v1('COMPORT', ID, VALUE); 

Example:
To read a connected valve with an ID of 34.
gsioc_valve_position_v1(s_connect, 34, 'read');

To set a connected valve with an ID of 34 to position 5.
gsioc_valve_position_v1(s_connect, 34, 5);

