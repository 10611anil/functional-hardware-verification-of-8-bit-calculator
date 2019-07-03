module dsd_final();
parameter simulation_cycle = 100;

bit clk;

always #(simulation_cycle/2) 
    clk = ~clk;
	
intf1 intf_dsd(clk);
dsd_test t1(intf_dsd.TEST);
top d1(.sum(intf_dsd.sum),.carry(intf_dsd.carry),.A(intf_dsd.A),.B(intf_dsd.B),.in_car(intf_dsd.in_car),
.clk(clk),.reset(reset));	

endmodule