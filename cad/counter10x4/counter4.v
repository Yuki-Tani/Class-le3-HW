module counter4(
	input clock,
	output reg [1:0] count,
	output reg overflow);
	
	always @(posedge clock)
	begin
		overflow <= 0;
		if(count == 2'b11) begin
			overflow <= 1;
			count <= 2'b00;
		end else begin
			count <= count + 2'b01;
		end
	end
endmodule
