module First_Register (
    input  logic        clk ,rst,
    input  logic        StallD,
 	input  logic        FlushD,
    input  logic [31:0] Addr,Inst,
    output logic [31:0] AddrF,InstF
);
    always_ff @( posedge clk ) begin 
     
        if(rst) begin
            AddrF <= 32'b0;
            InstF <= 32'b0;
        end
        else if(StallD) begin
            AddrF <= AddrF;
            InstF <= InstF;
        end

        else if (FlushD) begin
			AddrF <= 32'b0;
 			InstF <= 32'h0x00000013;
 		end    

        else begin
            AddrF <= Addr;
            InstF <= Inst;
        end
    end
    
endmodule
