`timescale 1ns / 1ps

module fulladd(s,cry,a,b,c,aa,bb,cc);
 output s,cry,aa,bb,cc;
 input a,b,c;

assign aa=a;
assign bb=b;
assign cc=c;

assign s = (a ^ b ^ c);
assign cry = (a & b)|((a ^ b)&c);

endmodule