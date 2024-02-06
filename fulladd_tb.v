`timescale 1ns / 1ps

module fulladd_tb;
 wire y;
 reg a,b,c;
 
fulladd dut(y,a,b,c);

initial
 begin
  #0  a=0;b=0;c=0;
  #10 a=0;b=1;c=0;
  #10 a=1;b=0;c=0;
  #10 a=1;b=1;c=0;
  #10 a=0;b=0;c=1;
  #10 a=0;b=1;c=1;
  #10 a=1;b=0;c=1;
  #10 a=1;b=1;c=1;
  #10 $stop;
 end
 
endmodule