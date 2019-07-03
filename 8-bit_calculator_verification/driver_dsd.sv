`include "/nfs/home/a/a_band/dsd_verilog/dsd_verification/generator_dsd.sv"
class driver;
int no_trans;
virtual intf1 intf;
transaction trans;
mailbox #(transaction) gen2driv;

function new (mailbox #(transaction) gen2driv,virtual intf1 intf);
this.gen2driv = gen2driv;
this.intf = intf;
endfunction

task reset();
 // wait(intf.cb1.reset);
$display("@%t:reset is turned on",$time);
repeat(3)
begin
  @(posedge intf.clk)
intf.cb1.reset <= 1'b1;
intf.cb1.A <= 0;
intf.cb1.B <= 0;
intf.cb1.in_car <= 0;
end
intf.cb1.reset <= 1'b0;
//wait(!intf.cb1.reset);
$display("@%t:reset in turned off",$time);
endtask

task driv_run();
$display("@%t:run method is started",$time);
forever begin
gen2driv.get(trans);
@(posedge intf.clk)
intf.cb1.A <= trans.A;
intf.cb1.B <= trans.B;
intf.cb1.in_car <= trans.in_car;
no_trans++;
end
$display("@%t:run method is ended",$time);
endtask

endclass