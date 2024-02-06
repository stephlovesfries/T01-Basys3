`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 19:01:16
// Design Name: 
// Module Name: adder_tb
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

module adder_tb;
 reg [2:0] sw;
 wire sum, carry;

adder dut(sw[2:0],sum,carry);

initial 
 begin
 #0 sw[2] = 0; sw[1] = 0; sw[0] = 0;
 #10 sw[2] = 0; sw[1] = 0; sw[0] = 1;
 #10 sw[2]= 0; sw[1] = 1; sw[0] = 0;
 #10 sw[2] = 0; sw[1] = 1; sw[0] = 1;
 #10 sw[2] = 1; sw[1] = 0; sw[0] = 0;
 #10 sw[2]= 1; sw[1] = 0; sw[0] = 1;
 #10 sw[2] = 1; sw[1] = 1; sw[0] = 0;
 #10 sw[2] = 1; sw[1] = 1; sw[0] = 1;
 #10 $stop;
 end
                
endmodule
