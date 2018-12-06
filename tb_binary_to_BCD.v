`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2018 06:53:14 PM
// Design Name: 
// Module Name: tb_binary_to_BCD
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


module tb_binary_to_BCD();
reg [7:0] a;
wire [3:0] out1;
wire [3:0] out2;
wire [1:0] out3;

binary_to_BCD u1(a, out1, out2, out3);
initial begin
    a[0]=0;
    a[1]=0;
    a[2]=0;
    a[3]=0;
    a[4]=0;
    a[5]=0;
    a[6]=0;
    a[7]=0;
    #100;
    a[0]=1;
    #100;
    a[1]=1;
    #100;
    a[2]=1;
    a[3]=1;
    #100;
    a[4]=1;
    #100;
    a[5]=1;
    #100;
    a[6]=1;
    #100;
    a[7]=1;
    #100;
    a[3] = 0;
    #100;
    a[5] = 0;
end
endmodule
