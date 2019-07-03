`include "/nfs/home/a/a_band/dsd_verilog/dsd_verification/environment_dsd.sv"
program dsd_test (intf1.TEST intf2);
environment env;
initial
begin
env = new(intf2);
env.gen.count = 10;
env.run;
end 
endprogram