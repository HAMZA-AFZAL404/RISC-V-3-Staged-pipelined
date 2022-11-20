module Instruction_Fetch (
    input logic [31:0] InstF,
    output logic [4:0] raddr1,raddr2,waddr
);

always_comb begin
        raddr1 = InstF[19:15];
        raddr2 = InstF[24:20];
        waddr  = InstF[11:7];  
end
endmodule