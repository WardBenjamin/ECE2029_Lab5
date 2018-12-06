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
module resptime(input clk, output [3:0] an, output [6:0] seg, output dp, input reset, input start, input stop, output [7:0] led);

//---definition for display
parameter zero = 4'b0000;
wire clk_out;
//wire [1:0] counter_out;
wire [3:0] ones, tens, hundreds;

//---definition for state machine
wire [8:0] randnum;
wire showhi;
wire [7:0] resptime;

//---state machine
pngenerator u3(clk, reset, randnum);
fsmfsm u4(clk_out, reset, start, stop,randnum, resptime, showhi, led);

//---display
binary_to_BCD u0(resptime, ones, tens, hundreds);
display u1(ones, tens, hundreds, zero, showhi, dp, clk, clk_out, seg, an);
slowclock u2(clk, clk_out);
//my_counter u3(clk_out, counter_out);
endmodule
