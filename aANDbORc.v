`timescale 1ns / 1ps

module aANDbORc(y,a,b,c,aa,bb,cc);
 output y,aa,bb,cc;
 input a,b,c;

assign aa=a;
assign bb=b;
assign cc=c;

assign y = (a & b)|c;

endmodule