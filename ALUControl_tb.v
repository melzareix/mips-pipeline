module tb4;
reg[2:0] ALUop;
reg[5:0] funct;
wire [2:0] ALUcontrol;

 ALUControl AC(ALUcontrol,ALUop,funct);
 
 
 
//  initial
//  begin  
//  fork
//  		$monitor("%t %h ", $time, ALUcontrol);
// 		# 5 ALUop <= 3'b101;

// 		# 10 ALUop <= 3'b100;
// 		# 15 ALUop <= 3'b011;
// 		# 20 ALUop <= 3'b100;
// 		# 25 ALUop <= 3'b000;
// 		# 30  funct<= 6'b10_1010;
// 		#35 ALUop <= 3'b010;
//     //	# 1000 $finish;
//  join
//  end
 

endmodule