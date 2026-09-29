`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 11:26:59 AM
// Design Name: 
// Module Name: tb_Lab4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Lab4();
reg SB;
reg DOOR;
reg KEY;
reg BRK;
reg PARK;
reg HOOD;
reg BAT_OK;
reg AIB_OK;
reg TMP_OK;
reg PASS_OCC;
reg SB_P;
reg TRUNK;
reg PBRK;
reg SRV;
wire START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN;

VehicleSafetySys uut(.SB(SB),.DOOR(DOOR),.KEY(KEY),.BRK(BRK),.PARK(PARK),.HOOD(HOOD),.BAT_OK(BAT_OK),.AIB_OK(AIB_OK),.TMP_OK(TMP_OK),.PASS_OCC(PASS_OCC),.SB_P(SB_P),.TRUNK(TRUNK),.PBRK(PBRK),.SRV(SRV),
               .START_PERMIT(START_PERMIT),.CHIME(CHIME),.WARN_PRI2(WARN_PRI2),.WARN_PRI1(WARN_PRI1),.SEAT_WARN(SEAT_WARN),.DOOR_WARN(DOOR_WARN),.HOOD_WARN(HOOD_WARN),.TRUNK_WARN(TRUNK_WARN),.BAT_WARN(BAT_WARN),.AIRBAG_WARN(AIRBAG_WARN),.TEMP_WARN(TEMP_WARN));

initial begin
    //test 1 everything good
    SB = 1'b1;
    DOOR = 1'b1;
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;

    //test 2 driver not buckled
    SB = 1'b0; //tested
    DOOR = 1'b1;
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;

    //test 3 passenger in seat but not buckled, then buckled
    SB = 1'b1;
    DOOR = 1'b1;
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b1; 
    SB_P = 1'b0; 
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;
    SB_P = 1'b1; //buckled
    #10;

    //test 4 door open
    SB = 1'b1;
    DOOR = 1'b0; //tested
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;

    //test 5 battery bad
    SB = 1'b1;
    DOOR = 1'b1;
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b0; //tested
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;

    //test 6 temp bad and door open, pri1 should be chosen over pri2
    SB = 1'b1;
    DOOR = 1'b0; 
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b0; 
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;

    //test 7 hood open, service mode on
    SB = 1'b1;
    DOOR = 1'b1;
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b0; //hood open
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;
    SRV = 1'b1; //service mode on
    #10;

    //test 8 out of park, parking brake on
    SB = 1'b1;
    DOOR = 1'b1;
    KEY = 1'b1;
    BRK = 1'b1;
    PARK = 1'b0; //out of park
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b1; //parking break on
    SRV = 1'b0;
    #10;

    //test 9  no key, everything should be off
    SB = 1'b1;
    DOOR = 1'b0;
    KEY = 1'b0; //no key
    BRK = 1'b1;
    PARK = 1'b1;
    HOOD = 1'b1;
    BAT_OK = 1'b1;
    AIB_OK = 1'b1;
    TMP_OK = 1'b1;
    PASS_OCC = 1'b0;
    SB_P = 1'b0;
    TRUNK = 1'b1;
    PBRK = 1'b0;
    SRV = 1'b0;
    #10;

    $finish;
end
endmodule