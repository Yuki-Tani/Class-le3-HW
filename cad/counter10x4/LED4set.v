module LED4set(
	input CK,
	input [7:0] LED3,LED2,LED1,LED0,
	output reg [7:0] LED,
	output reg [3:0] selecters);
	
	wire [1:0] num;
	wire vdd;
	assign vdd = 1;
	counter4 counter(.clock(CK),.plus(vdd),.count(num));

	always @(posedge CK)
	begin
		case (num)
			2'b00: begin 
						selecters <= 4'b0111;
						LED <= LED3;
					 end
			2'b01: begin
						selecters <= 4'b1011;
						LED <= LED2;
					 end
			2'b10: begin 
						selecters <= 4'b1101;
					   LED <= LED1;
					 end
			2'b11: begin
						selecters <= 4'b1110;
					   LED <= LED0;
					 end
			default : begin
							selecters <= 4'b0000;
							LED <= 8'b00000001;
						end
		endcase
	end
endmodule
