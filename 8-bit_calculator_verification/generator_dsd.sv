`include "/nfs/home/a/a_band/dsd_verilog/dsd_verification/transaction.sv"
class generator;
rand transaction trans;
mailbox #(transaction) gen2driv;
int count;

 function new(mailbox #(transaction) gen2driv);
 this.gen2driv = gen2driv;
 endfunction

 task gen_main();
 repeat (count)
 begin
 trans = new();
 if(!trans.randomize())
 $display("randomization failed");
 trans.display;
 gen2driv.put(trans);
 end
 
 endtask
endclass