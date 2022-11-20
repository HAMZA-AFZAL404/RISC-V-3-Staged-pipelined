module mux_selA (
    input logic         sel_A, //from controller
    input logic  [31:0] SrcAE,AddrF,
    output logic [31:0] SrcA
);
always_comb begin 
    case (sel_A)
       1'b0 : SrcA = AddrF;
       1'b1 : SrcA = rdata1;
    endcase  
end
endmodule

