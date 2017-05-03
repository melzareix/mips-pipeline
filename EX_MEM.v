module EX_MEM(WriteDataO,AluResO,BranchAddressO,RdO,WBO,MemRead, MemWrite, Branch,ZFO,bneO,clk,
WriteData,AluRes,BranchAddress,Rd,WB,MEM,ZF,bne);

// outputs 
output reg [31:0] AluResO,WriteDataO;
output reg [6:0] BranchAddressO;
output reg [4:0] RdO;
output reg [1:0] WBO;
output reg ZFO, MemRead, MemWrite, Branch;
output reg bneO;

// inputs 
input clk ;
input [31:0] AluRes,PC,WriteData;
input [6:0]BranchAddress;
input [4:0] Rd;
input [1:0] WB;
input [2:0] MEM;
input ZF ;
input bne;

initial
begin
    AluResO=32'b0;
    WriteDataO=32'b0;
    BranchAddressO=7'b0;
    RdO=5'b0;
    WBO=2'b0;
    MemRead=0;
    MemWrite=0;
    Branch=0;
    ZFO=0;
    bneO=0;
end
// On clock
always@(posedge clk)
    begin
        WriteDataO <= WriteData;
        AluResO <= AluRes;
        BranchAddressO <= BranchAddress;
        RdO <= Rd;
        WBO<= WB;
        MemWrite<=MEM[0];
        MemRead<= MEM[1];
        Branch<= MEM[2];
        ZFO<= ZF;
        bneO<=bne;
    end


endmodule

