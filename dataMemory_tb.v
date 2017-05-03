module tb6;

reg MemWrite,MemRead;
reg [1:0] address;
reg [31:0] writeData;
wire [31:0]readData;
reg clk ; 


//DataMemory DM(readData,address,writeData,MemWrite,MemRead);
 initial begin clk = 0;

forever
	begin
		#5 clk = ~clk; 	  
	    
	end
end 

 initial
 begin  
 fork
//  		$monitor("%t %b", $time,readData);
//  		#3 writeData <= 32'b00000111011111111101111111111111;
//  		# 5 MemWrite <= 1'b1;   
//  		# 5 MemRead <=1'b0;
//  		#5 address <= 2'b 01;
//  		# 10 address<= 2'b00;
//  		# 30 MemWrite <=1'b0 ;
//  		#30 MemRead<=1'b1; 
//  		# 35 address <=  2'b01 ;
//  		# 40 address <=  2'b00 ;
//  	    # 50 $finish; 
 		
join
 end
 

endmodule
