`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2018 09:34:58 AM
// Design Name: 
// Module Name: hi_prelab
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


module hi_prelab(
input clk,
input hi,
input [7:0] sw,
output reg [6:0] seg,
output [3:0] an,
output reg dp
);

reg [1:0] digitSelect;

bcddisplay4 u2(clk, sw, an, seg);


always @(posedge clk) begin
if(hi == 1) begin
    digitSelect = 2'b00;
    seg <= 7'b1111001;
    digitSelect = 2'b01;
    seg = 7'b1001000;
    dp <= 1'b0;
   end
else begin
   dp <= 1'b1;
end
end

decoder2to4 u1(digitSelect, an);

endmodule
