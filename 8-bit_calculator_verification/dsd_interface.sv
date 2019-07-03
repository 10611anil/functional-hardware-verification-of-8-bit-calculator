interface intf1(input clk);
logic [7:0] A;
logic [15:0] B;
logic reset;
logic in_car;
logic [15:0] sum;
logic carry;

clocking cb1 @(posedge clk);
output A;
output B;
output in_car;
output reset;
endclocking

modport TEST(clocking cb1);

endinterface