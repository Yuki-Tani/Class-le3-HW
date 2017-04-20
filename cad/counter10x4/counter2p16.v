module counter2p16(
	input clock,
	input plus,
	output reg [15:0] count,
	output reg overflow);
	
	always @(posedge clock)
	begin
		overflow <= 0;
		if(plus==1) begin
			if(count == 16'b1111_1111_1111_1111) begin
				overflow <= 1;
				count <= 0;
			end else begin
				count <= count + 1;
			end
		end
	end
endmodule