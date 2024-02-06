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
