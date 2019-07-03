`include "/nfs/home/a/a_band/dsd_verilog/dsd_verification/driver_dsd.sv"
class environment;
generator gen;
driver driv1;
mailbox #(transaction) gen2driv;
virtual intf1 intf;

function new(virtual intf1 intf);
this.intf = intf;
gen2driv = new();
gen = new(gen2driv);
driv1 = new(gen2driv,intf);
endfunction

task pre_reset();
driv1.reset();
endtask

task stim_gen();
fork
gen.gen_main;
driv1.driv_run;
join_none
endtask

task terminate();
wait(gen.count == driv1.no_trans);
endtask

task run();
pre_reset();
stim_gen();
terminate();
endtask

endclass