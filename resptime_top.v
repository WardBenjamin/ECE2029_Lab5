`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:13 04/09/2012 
// Design Name: 
// Module Name:    bcddisplay4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module resptime(input clk, input show, output [3:0] an, output [6:0] seg, output dp, input [0:7] sw);

//---definition for display
parameter zero = 4'b0000;
wire clk_out;
//wire [1:0] counter_out;
wire [3:0] ones, tens, hundreds;

//---definition for state machine

//---display
binary_to_BCD u0(sw, ones, tens, hundreds);
display u1(ones, tens, hundreds, zero, show, dp, clk, clk_out, seg, an);
slowclock u2(clk, clk_out);
//my_counter u3(clk_out, counter_out);
endmodule
