module counter8(
	input clock,
	input plus,
	output reg [2:0] count,
	output reg overflow);
	
	always @(posedge clock)
	begin
		overflow <= 0;
		if(plus==1) begin
			if(count == 3'b111) begin
				overflow <= 1;
				count <= 3'b000;
			end else begin
				count <= count + 3'b001;
			end
		end
	end
endmodule
