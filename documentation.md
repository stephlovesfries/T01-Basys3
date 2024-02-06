# T01 Logic Gates Hands-on Task (Basys-3)
## **Logic Gates Hands-on Task**  
Our group aimed to design a logic function using Verilog and implement it on the Basys-3. The logic function was designed based on the given boolean expression:   
> **y = ab+c**

| a | b | c | y |
| ----- | ----- | ----- | ----- |
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 1 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 1 | 1 |

## **Constrain file setup**  
We downloaded the Basys-3 constrain file and unhashed the respective lines of Switches and LEDs. Furthermore, the following input-output connections were assigned to make the code easier to understand and manipulate in later stages:
> **Input: a:V17, b:V16, c:W16**
> **Output: aa:U16, bb:E19, cc:U19, y:V19**

## **Module and testbench**
The module code was written using Verilog operations to fulfill the desired logic function:
> y = ab + c  &rarr;  y = (a & b) | c

```cp
'timescale 1ns / 1ps

module aANDbORc (y, a, b, c, aa, bb, cc);
  output y,aa,bb,cc;
  input a,b,c;

assign aa=a;
assign bb=b;
assign cc=c;

assign y = (a & b) | c;


endmodule

```
The testbench code was also written to check whether the module functioned properly.
```cp
'timescale 1ns / 1ps

module aANDbORc_tb;
  wire y;
  reg a,b,c;
aANDbORc dut(y,a,b,c);

initial
  begin
  #0 a=0 ; b=0 ; c=0 ;
  #10 a=0 ; b=1 ; c=0 ;
  #10 a=1 ; b=0 ; c=0 ;
  #10 a=1 ; b=1 ; c=0 ;
  #10 a=0 ; b=0 ; c=1 ;
  #10 a=0 ; b=1 ; c=1 ;
  #10 a=1 ; b=0 ; c=1 ;
  #10 a=1 ; b=1 ; c=1 ;
  #10 $stop;
  end
endmodule

```
A simulation was run in Vivado using the module and testbench before implementing on Basys-3 .

After verifying that the module and testbench produced the correct logic results, the design was successfully implemented on Basys-3 (video was submitted separately). 

# Full Adder Optional Task
Using the given table, our group observed the following logic:
> Sum = a $\oplus$ b $\oplus$ c
> Cout = (a & b) + (b & c) + (c & a)

| | Output | Output| Input | Input| Input |
|-----|-----|------|-----|-----|------|
|signal|cout|sum|cin|a|b|
| | 0 | 0 | 0 | 0 | 0 |
| | 0 | 1 | 0 | 0 | 1 |
| | 0 | 1 | 0 | 1 | 0 |
| | 1 | 0 | 0 | 1 | 1 |
| | 0 | 1 | 1 | 0 | 0 |
| | 1 | 0 | 1 | 0 | 1 |
| | 1 | 0 | 1 | 1 | 0 |
| | 1 | 1 | 1 | 1 | 1 |

##**Module and testbench design**
The module code was written through two approaches (with different constrain file switch and LED names) using Verilog operations to fulfill the desired logic function:
```cp
#Approach 1
module adder(sw[2:0],sum,carry);
  input [2:0] sw;
  output sum, carry;
assign sum = sw[2] ^ sw[1] ^ sw[0];
assign carry = (sw[2] & sw[1]) | (sw[1] & sw[0]) | (sw[2] & sw[0]);

endmodule
```
```cp
#Approach 2
module fulladd(s,cry,a,b,c,aa,bb,cc);
  output s, cry, aa, bb, cc;
  input a, b, c;

assign aa=a;
assign bb=b;
assign cc=c;

assign s = (a ^ b ^ c);
assign cry = (a & b) | ((a ^ b) & c));

endmodule
```
The testbench code was also written to check that the module functioned properly.
```cp
#Approach 1
module adder_tb;
  reg[2:0] sw;
  wire sum, carry;

adder dut(sw[2:0],sum,carry);

initial
  begin
#0 sw[2] = 0; sw[1] = 0; sw[0] = 0;
#10 sw[2] = 0; sw[1] = 0; sw[0] =1;
#10 sw[2] = 0; sw[1] = 1; sw[0] =0;
#10 sw[2] = 0; sw[1] = 1; sw[0] =1;
#10 sw[2] = 1; sw[1] = 0; sw[0] =0;
#10 sw[2] = 1; sw[1] = 0; sw[0] =1;
#10 sw[2] = 1; sw[1] = 1; sw[0] =0;
#10 sw[2] = 1; sw[1] = 1; sw[0] =1;
#10 $stop;
end

endmodule
```
```cp
#Approach 2
module fulladd_tb;
  wire y;
  reg a, b, c;

fulladd dut(y,a,b,c);

initial
  begin
  #0 a = 0; b = 0; c = 0;
  #10 a = 0; b = 1; c = 0;
  #10 a = 1; b = 0; c = 0;
  #10 a = 1; b = 1; c = 0;
  #10 a = 0; b = 0; c = 1;
  #10 a = 0; b = 1; c = 1;
  #10 a = 1; b = 0; c = 1;
  #10 a = 1; b = 1; c = 1;
  #10 $stop;
  end

endmodule
```
A simulation was run in Vivado using the module and testbench before implementing on Basys-3.

After verifying that the module and testbench produced the correct logic results, the design was successfully implemenyed on Basys-3 (video was submitted separately).

##**Challenges and learnings**
Our group was initially unfamiliar with using Vivado software and would often run into errors when writing the code. But through this experience, we became more experienced in designing modules, testbenches, and simulations. Furthermore, we learned to implement  our logic gate designs in Vivado to a Basys-3 FPGA board. 
