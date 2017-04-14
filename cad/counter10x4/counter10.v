module counter10(
	input clock,
	output reg [3:0] count,
	output reg overflow);
	
	always @(posedge clock)
	begin
		overflow <= 0;
		if(count == 4'd9) begin
			overflow <= 1;
			count <= 4'd0;
		end else begin
			count <= count + 4'd1;
		end
	end
endmodule
