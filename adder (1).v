`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 18:53:50
// Design Name: 
// Module Name: adder
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


module adder(sw[2:0],sum,carry);
 input [2:0] sw;
 output sum, carry;


assign sum = sw[2]^sw[1]^sw[0];
assign carry = (sw[2]&sw[1])|(sw[1]&sw[0])|(sw[2]&sw[0]);

endmodule
