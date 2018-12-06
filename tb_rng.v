`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2018 07:20:42 PM
// Design Name: 
// Module Name: tb_rng
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


module tb_rng();
    reg clk;
    reg rst;
    wire [8:0] count;
    
    pngenerator UUT(clk, rst, count);
    
    initial begin
    clk = 0;
    rst = 0;
        for(integer i = 0; i < 30; i = i + 1) begin
            #5;
            clk = clk + 1;
        end
    end
    
endmodule
