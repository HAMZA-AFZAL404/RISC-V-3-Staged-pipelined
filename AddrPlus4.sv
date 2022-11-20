module AddrPlus4 (
  input  logic [31:0] AddrDE,
  output logic [31:0] AddrPlus4
);

  assign AddrPlus4 = AddrDE + 4;
  
endmodule
