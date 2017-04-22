module LED8set(
	input CK,
	input [7:0] LEDa, LEDb, LEDc, LEDd,
					LEDe, LEDf, LEDg, LEDh,
	output reg [7:0] LED,
	output reg [7:0] selecters);
	
	wire [2:0] num;
	wire vdd;
	assign vdd = 1;
	counter8 counter(.clock(CK),.plus(vdd),.count(num));

	always @(posedge CK)
	begin
		case (num)
			3'b000: begin 
						selecters <= 8'b0111_1111;
						LED <= LEDa;
					 end
			3'b001: begin
						selecters <= 8'b1011_1111;
						LED <= LEDb;
					 end
			3'b010: begin 
						selecters <= 8'b1101_1111;
					   LED <= LEDc;
					 end
			3'b011: begin
						selecters <= 8'b1110_1111;
					   LED <= LEDd;
					 end
			3'b100: begin 
						selecters <= 8'b1111_0111;
						LED <= LEDe;
					 end
			3'b101: begin
						selecters <= 8'b1111_1011;
						LED <= LEDf;
					 end
			3'b110: begin 
						selecters <= 8'b1111_1101;
					   LED <= LEDg;
					 end
			3'b111: begin
						selecters <= 8'b1111_1110;
					   LED <= LEDh;
					 end					 
			default : begin
							selecters <= 8'b00000000;
							LED <= 8'b00000001;
						end
		endcase
	end
endmodule