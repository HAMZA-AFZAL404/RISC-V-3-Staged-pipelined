module Fowrard_unit (
    input  logic       PCsrc,reg_wr,
    input  logic [4:0] rdata1, rdata2,waddr,waddrDE,
    input  logic [1:0] wb_sel,

    output logic       ForwardAE, ForwardBE,
    output logic       StallF, StallD, FlushD
    
);

  logic rs1_valid;
  logic rs2_valid;
  logic lwStall;


// Check the validity of the source operands from EXE stage
  assign rs1_valid = |exe2fwd.rs1_addr;
  assign rs2_valid = |exe2fwd.rs2_addr;

// Hazard detection
  always_comb begin
    if ((rdata1 == waddr) & (reg_wr) & rs1_valid ) begin
      ForwardAE <= 1'b1;
    end
    else begin
      ForwardAE <= 1'b0;
    end

  end

  always_comb begin
    if ((rdata1 == waddr) & (reg_wr) & rs2_valid ) begin
      ForwardBE <= 1'b1;
    end
    else begin
      ForwardBE <= 1'b0;
    end

  end

  always_comb begin//Stall when a load hazard occur
    lwStall <= (wb_sel[0] & ((rdata1 == waddr) | (rdata2 == waddr)));//Page 450 
    StallD <= lwStall;
    StallF <= lwStall;
    //Flush When a branch is taken or a load initroduces a bubble
    FlushD <= lwStall | PCsrc;
  end

endmodule