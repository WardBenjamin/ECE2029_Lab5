`timescale 1ns / 1ps

module fsmfsm(input clk_out, input reset, input start, input stop, input [8:0] randnum, 
output reg [7:0]resptime, output reg showhi, output reg [7:0] leds);

reg [9:0] counter1;
reg [8:0] randnum1; // some random delay between 2 to 5 seconds
parameter clearstate=2'b00, startstate=2'b01, timingstate=2'b10, stopstate=2'b11;
reg [1:0] state;

always @(posedge clk_out)
begin
if (reset) begin
	state <= clearstate;
	resptime <= 0;
	showhi <= 0;
	counter1 <= 0;
	leds <= 8'b0;
	end else
	case(state)
	clearstate:	begin
			resptime <= 0;
			showhi <=0;
			counter1 <=0;
			leds <= 8'b0;
			if(start) begin
				state <= startstate; 
				showhi <= 1; 
				randnum1 <= randnum;
				end else begin
				state <= clearstate;
				end
			end
	
	startstate:	if(counter1 > randnum1) begin
				state <= timingstate;
				showhi <= 0;
				leds <= 8'b11111111;
				counter1 <= 0;
				end else begin
				state <= startstate;
				counter1 <= counter1 + 1;
				end
				
	timingstate:	if(stop) begin
				state <= stopstate;
				leds <= 8'b0;
				end else begin
				state <= timingstate;
				resptime <= resptime + 1;
				end
				
	stopstate:	if(start) begin 
			state <= startstate;
			showhi <= 1;
			resptime <= 0;
			randnum1 <= randnum;
			end else begin
			state <= stopstate;
			counter1 <= 0;
			showhi <= 0;
			end
	default:	state <= clearstate;
	endcase
end	

endmodule
