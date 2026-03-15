module ven_in_need_tb;

reg clk;

reg [1:0] in;

reg rst;

wire out;

wire [1:0] change;

ven_in_need uut(
  .clk(clk),
  .rst(rst) , 
  .in(in) , 
  .out(out), 
  .change(change));
 initial
begin

$dumpfile ("ven_in_need.vcd");

$dumpvars(0,ven_in_need_tb);

rst =1;

clk = 0;

#6

rst = 0;

in = 1;

#11

in = 1;

#16

in = 1;

#25

$finish;

end

always #5 clk = ~clk;

endmodule
