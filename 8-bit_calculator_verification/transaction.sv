class transaction;
rand logic [15:0] B;
rand logic [7:0] A;
rand logic in_car;
rand logic reset;
rand logic clk;

constraint C1 {B inside {[1:500]};}
 
 function void display();
 $display("A=%d,B=%d,in_car=%d,reset=%d",A,B,in_car,reset);
 endfunction
 
 function transaction copy();
 copy = new();
 copy.A = A;
 copy.B = B;
 copy.in_car = in_car;
 copy.reset = reset;
 endfunction
endclass



