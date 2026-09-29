# ECE128-FPGA-LAB4

## Overview
For this lab we designed a vehicle safety system using combinational logic and put it on the Basys3 board. It takes 14 inputs about the state of the car and outputs a bunch of warning lights, a chime, and whether the car is allowed to start.

All the warnings only turn on when the key is in.

### Inputs (switches)
- `SB` - driver seatbelt buckled
- `DOOR` - door closed
- `KEY` - key in
- `BRK` - brake pressed
- `PARK` - in park
- `HOOD` - hood closed
- `BAT_OK` - battery good
- `AIB_OK` - airbag good
- `TMP_OK` - engine temp good
- `PASS_OCC` - passenger seat occupied
- `SB_P` - passenger seatbelt buckled
- `TRUNK` - trunk closed
- `PBRK` - parking brake on
- `SRV` - service mode

### Outputs (LEDs)
- `SEAT_WARN`, `DOOR_WARN`, `HOOD_WARN`, `TRUNK_WARN`, `BAT_WARN`, `AIRBAG_WARN`, `TEMP_WARN` - individual warnings
- `WARN_PRI1` - critical warning (airbag, battery, or temp)
- `WARN_PRI2` - lower priority warning (seatbelt, door, hood, trunk, or out of park with the parking brake on). Only shows up if there's no priority 1 warning
- `CHIME` - goes off for any warning, but is muted in service mode
- `START_PERMIT` - car can start if the key is in, brake is pressed, it's in park, and the battery is good, plus either service mode is on OR the driver is buckled, door and hood are closed, and temp and airbag are OK

## Testbench
`tb_Lab4` runs through 9 cases:
1. Everything good
2. Driver not buckled
3. Passenger in seat not buckled, then buckled
4. Door open
5. Battery bad
6. Temp bad and door open (checks that pri1 overrides pri2)
7. Hood open, then service mode turned on
8. Out of park with the parking brake on
9. No key (everything should be off)

## Constraints
The constraint file maps the 14 inputs to switches and all 11 outputs to LEDs on the Basys3.

## Run Instructions
1. Create a new project and select the board you're uploading to
2. Add the design file under the design folder: `VehicleSafetySys`
3. Add the testbench under the simulation folder: `tb_Lab4`
4. Add the constraint file under the constraint folder
5. Run Synthesis
6. Run Implementation
7. Generate Bitstream
8. Find the device and program it
