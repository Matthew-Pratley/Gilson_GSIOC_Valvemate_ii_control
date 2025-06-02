%%  tests the connection function

s_connect = gsioc_valve_serial_connection_v1('COM3');

%% tests the input function

gsiocserialinput_v1(s_connect, 34, 'B', 'P3');

%% tests the input fnction with multiple valves connected

for i = 1:6;
    pos = strcat('P', num2str(i));

    %left
    gsiocserialinput_v1(s_connect, 35, 'B', pos);
    pause (1)
    
    %right
    gsiocserialinput_v1(s_connect, 34, 'B', pos);
    pause (1)

    % middle
    if i <= 2;
        gsiocserialinput_v1(s_connect, 36, 'B', pos);
    end
    pause (1)


end

% resets positions
 pos = strcat('P', num2str(1));

%left
gsiocserialinput_v1(s_connect, 35, 'B', pos);
    
%right
gsiocserialinput_v1(s_connect, 34, 'B', pos);

%middle
gsiocserialinput_v1(s_connect, 36, 'B', pos);


%% sets valve positions function test

gsioc_valve_position_selector_v1(s_connect, 34, 2);


%% clears error function test

% creates error to be tested 
gsiocserialinput_v1(s_connect, 34, 'B', 'P99');

%% clears error from valve
gsioc_valve_error_clear_v1(s_connect, 34);


%% discconects valves

gsioc_valve_disconnect_v1(s_connect);
% clears the old connection from the workspace
clear s_connect

%% reads valve 

gsioc_valve_position_reader_v1(s_connect, 36);

%% valve reset and home 

gsioc_valve_reset_v1(s_connect, 34);


%% gsioc position function test 

% reads valve position
gsioc_valve_position_v1(s_connect, 34, 'read');

% sets a new valve position
gsioc_valve_position_v1(s_connect, 34, 5);

