`timescale 1ns/1ps
module elevator_controller_tb;

reg [7:0]request_floor;
reg [7:0]in_current_floor;
reg clk;
reg reset;
reg over_time;
reg over_weight;

wire direction;
wire complete;
wire door_alert;
wire weight_alert;
wire [7:0] out_current_floor;

iiitb_elc UUT(
.request_floor (request_floor),
.in_current_floor (in_current_floor),
.clk(clk),
.reset (reset),
.direction (direction),
.out_current_floor (out_current_floor),
.complete (complete),
.over_time (over_time),
.over_weight (over_weight),
.door_alert (door_alert),
.weight_alert (weight_alert));


//Generate the clock and test the circuit with different inputs
initial
begin
$dumpfile ("elc.vcd"); 
$dumpvars(0,elevator_controller_tb);
#0 clk =1'b0; reset =1'b1; over_time=1'b0; over_weight=1'b0;
#50 reset =1'b0;
#50 request_floor = 8'b00000001; in_current_floor = 8'b10000000;
//#50 reset =1;
//#50 reset =0;

#50 over_time =1;
#200 over_time =0;
#50 reset =1'b1;
#200 reset =1'b0;
#100 over_weight =1;
#500 over_weight =0;

//#50 reset = 1'b1;
end
always
#50 clk=~clk;

endmodule
