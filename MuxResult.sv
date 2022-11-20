module MuxResult (
    input logic  [1:0]  wb_sel, //From controller
    input logic  [31:0] ALUResultDE,rdata,AddrPlus4,
    output logic [31:0] wdata
);

always_comb begin 
    case (wb_sel)
       2'b00 : wdata = AddrPlus4;
       2'b01 : wdata = ALUResultDE;
       2'b10 : wdata = rdata;
    endcase
    end
endmodule

