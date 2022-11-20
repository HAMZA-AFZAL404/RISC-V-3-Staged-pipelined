module forward_mux1 #(parameter WIDTH = 32)(
  input  logic [WIDTH-1:0] rdata1, ALUResultDE,
  input  logic             ForwardAE,
  output logic [WIDTH-1:0] SrcAE
);

//assign SrcAE = ForwardAE[1] ? ALUResultM : (ForwardAE[0] ? ResultW : RD1E);
always_comb
begin
case (ForwardAE)
 
 1'b0: SrcAE = rdata1;
 1'b1: SrcAE = ALUResultDE;

 default: SrcAE =rdata1;

endcase

end
endmodule