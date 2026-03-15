//	We define 3 states 0 for Rs.0 , 01 for Rs.5, 10 for Rs.10

//	The price of the product in the vending machine is Rs.15

module ven_in_need(in , rst , clk, out , change);

input [1:0]in;

//	input We will assume that there are only 5rs and 10rs currency in the system
input rst;

input clk;

output reg out;

  output reg [1:0]change;

parameter S0 = 2'b00;

parameter S1 = 2'b01;

parameter S2 = 2'b10;
 

 reg [1:0] current , next; // for current and next state

always@(posedge clk)

begin

  if(rst == 1)

begin

current = 0;

next = 0;

change = 2'b00;

end

else

current = next ;

case(current)

S0:

if (in==0)

begin

next = S0;

change = 2'b00;

out = 0;

end

else if (in== 2'b01)

begin

next = S1;

change = 2'b00;

out = 0;

end

  else if (in == 2'b10)

begin

next = S2;

change = 2'b00;

out = 0;

end

S1:

  if (in == 0)

begin

next = S0;

change = 2'b01;

out = 0;

end

else if (in== 2'b01)

begin
 
next = S2;

change = 2'b00;

out = 0;

end

  else if ( in == 2'b10)

begin

next = S0;

change = 2'b00;

out = 1;

end

S2:

  if (in == 0)

begin

next = S0;

change = 2'b10;

out = 0;

end

else if (in== 2'b01)

begin

next = S0;

change = 2'b00;

out = 1;

end

  else if (in == 2'b10)

begin

next = S0;

change = 2'b01;

out = 1 ;

end

default:

begin

next=S0;

change=2'b00;

out= 0;

end

endcase

end

endmodule
