`timescale 1ns / 1ps

module VehicleSafetySys(
    input  SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV,
    output START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN
);
    assign SEAT_WARN   = KEY & (~SB | (PASS_OCC & ~SB_P));
    assign DOOR_WARN   = KEY & ~DOOR;
    assign HOOD_WARN   = KEY & ~HOOD;
    assign TRUNK_WARN  = KEY & ~TRUNK;
    assign BAT_WARN    = KEY & ~BAT_OK;
    assign AIRBAG_WARN = KEY & ~AIB_OK;
    assign TEMP_WARN   = KEY & ~TMP_OK;

    assign WARN_PRI1 = AIRBAG_WARN | BAT_WARN | TEMP_WARN;
    assign WARN_PRI2 = ~WARN_PRI1 & (SEAT_WARN | DOOR_WARN | HOOD_WARN | TRUNK_WARN |(KEY & ~PARK & PBRK));   

    assign CHIME = ~SRV & (WARN_PRI1 | SEAT_WARN | DOOR_WARN | HOOD_WARN | TRUNK_WARN | (KEY & ~PARK & PBRK));

    assign START_PERMIT = KEY & BRK & PARK & BAT_OK & (SRV | (SB & DOOR & HOOD & TMP_OK & AIB_OK));
endmodule