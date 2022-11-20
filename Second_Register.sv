module Second_Register (
    input  logic        clk,rst,
    input  logic        StallE,
 	input  logic        FlushE,
    input  logic [4:0]  waddr,
    input  logic [31:0] AddrF,ALUResult,rdata2,
    output logic [31:0] AddrDE,ALUResultDE,rdata2DE,
    output logic [4:0]  waddrDE
    

);

always_ff @( posedge clk ) begin

    if( rst ) begin
        AddrDE      <= 32'b0;
        ALUResultDE <= 32'b0;
        rdata2DE    <= 32'b0;
        waddrDE     <= 32'b0;
    end
    else if(StallE) begin
        AddrDE      <= AddrDE ;
        ALUResultDE <= ALUResultDE;
        rdata2DE    <= rdata2DE;
        waddrDE     <= waddrDE;
    end
     
    else begin
        AddrDE      <= AddrF;
        ALUResultDE <= ALUResult;
        rdata2DE    <= rdata2;
        waddrDE     <= waddr;
    end
end 
endmodule