module ALUControl(ALUcontrol,ALUop,funct);
input[2:0] ALUop;
input[5:0] funct;
output reg [2:0] ALUcontrol;
 
always @(ALUop, funct)
begin
case(ALUop)
3'b000: ALUcontrol = 0; //lw,sw
3'b001: ALUcontrol = 1; //beq,bne
3'b011: ALUcontrol = 0; //addi
3'b100: ALUcontrol = 2; //andi
3'b101: ALUcontrol = 3; //ori
3'b010:  begin
            case(funct)
            6'b10_0000: ALUcontrol= 0; //add
            6'b10_0010: ALUcontrol= 1; //sub
            6'b10_0100: ALUcontrol= 2; //and
            6'b10_0101: ALUcontrol= 3; //or
            6'b00_0000: ALUcontrol= 4; //sll
            6'b00_0010: ALUcontrol= 5; //srl
            6'b10_1010: ALUcontrol= 6; //slt
            endcase
        end
endcase
end
 
endmodule