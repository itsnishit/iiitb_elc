module iiitb_elc (request_floor, in_current_floor, clk, reset, complete, direction, 
over_time, over_weight, weight_alert, door_alert, out_current_floor) ;

//input pins
input [7:0]request_floor; // the 8 bit input request floor
input [7:0]in_current_floor; // the 8 bit input floor,
input clk; //-ve generate = low Frequency clock
input reset; // the 1 bit input reset
input over_time; //the 1 bit input which indicates the door keep open for 3 ninutes
input over_weight; // the 1 bit input which indicates the weight in the elevator is larger than 900kgs


//output pins
output direction; // the 1 bit output which indicates the direction of the elevator
output complete;// the 1 bit output vhich indicates whether elevalor is running or stopped
output door_alert;// the 1 bit output vhich indicates the door keep open for 3 nimutes
output weight_alert;// the 1 bit output which nficates the weight in the elevator is larger than 900kgs
output [7:0] out_current_floor; // the 8 bit output which shows the current floor

//register parameters
reg r_direction;// 1 bit register connected to the output direction
reg r_complete;// 1 bit register connected to the output complete
reg r_door_alert;// 1 bit register connected to the output door_slert
reg r_weight_alert; // 1 bit register connected to the output veigh alert
reg [7:0] r_out_current_floor;// 8 bit register connected to the output out_current_floor;


always@(posedge clk)
begin
r_complete= 0;
r_direction = 1;
r_weight_alert = 0;
r_door_alert = 0;
if(reset)
	r_out_current_floor <= in_current_floor;

else if(!reset && !over_time && !over_weight)
	begin
//Case 1: normal movement of elevator
if (request_floor > r_out_current_floor) begin
r_direction <= 1'b1;
r_out_current_floor <= r_out_current_floor << 1;
end

else if (request_floor < r_out_current_floor) begin
r_direction <= 1'b0;
r_out_current_floor = r_out_current_floor >> 1;
end

else if (request_floor == r_out_current_floor) begin
r_complete <= 1;
r_direction <= 0;
end
end

 //Case 2: the door is kept open for more than 3 minutes
else if (!reset && over_time)
begin
r_door_alert <= 1;
r_complete <= 0;
r_weight_alert <= 0;
r_direction <= 0;
r_out_current_floor <= r_out_current_floor;
end

//Case 3: the total weight in the elevator is more than 900kgs
else if(!reset && over_weight)begin
r_door_alert <= 0;
r_weight_alert <= 1;
r_complete <= 0;
r_direction <= 0;
r_out_current_floor <= r_out_current_floor;
end
end

//match pins and registers
assign direction=r_direction;
assign complete=r_complete;
assign door_alert=r_door_alert;
assign weight_alert=r_weight_alert;
assign out_current_floor= r_out_current_floor;
endmodule

