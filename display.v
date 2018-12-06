`timescale 1ns / 1ps

module display(input [3:0] A, B, C, D, input showhi, output reg dp, input clk, input slowclk, output reg [6:0]disp, output reg [3:0] an );
reg [3:0] Y;	 
reg [6:0] disp1;
reg [6:0] disp2;
reg [1:0] sel;

always @(posedge slowclk)
//---------------2-bit counter for sel signal------
begin
sel = sel + 1;
end

always @(posedge clk) begin
//------------------display number-----------------
if (~showhi) begin
	case (sel)
	0: begin
	Y <= A;
	dp <= 1;
	an<=4'b1110;
	end
	1: begin
	Y <= B;
	dp <= 1;
	an<=4'b1101;
	end
	2: begin
	Y <= C;
	dp <= 0;
	an<=4'b1011;
	end
	3: begin
	Y <= D;
	dp <= 1;
	an<=4'b1111;
	end
	endcase
	disp <= disp2;
end else begin
//-------------------------display "hi"-----------------
	case (sel)
	0: begin
	dp <= 1;
	an<=4'b1110;
	disp1<=7'b1001111;
	end
	1: begin
	dp <= 1;
	an<=4'b1101;
	disp1<=7'b0001001;
	end
	2: begin
	dp <= 1;
	an<=4'b1111;
	disp1<=7'b0000000;
	end
	3: begin
	dp <= 1;
	an<=4'b1111;
	disp1<=7'b0000000;
	end
	endcase
	disp <= disp1;
end
end
//--------------------------mapping to 7seg(display number)-------------
always@(Y)
begin
case(Y)
0: disp2=7'b1000000;
1: disp2=7'b1111001;
2: disp2=7'b0100100;
3: disp2=7'b0110000;
4: disp2=7'b0011001;
5: disp2=7'b0010010;
6: disp2=7'b0000010;
7: disp2=7'b1111000;
8: disp2=7'b0000000;
9: disp2=7'b0010000;
10: disp2=7'b0001000;
11: disp2=7'b0000011;
12: disp2=7'b1000110;
13: disp2=7'b0100001;
14: disp2=7'b0000110;
15: disp2=7'b0001110;
endcase
end


endmodule
