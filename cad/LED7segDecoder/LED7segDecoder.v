module LED7segDecoder(
	input [3:0] number,
	output reg [7:0] led7seg,
	output gnd = 0);
	
	always @*
	begin
		case(number)
			4'h0 : led7seg = 8'b11111100;
			4'h1 : led7seg = 8'b01100000;
			4'h2 : led7seg = 8'b11011010;
			4'h3 : led7seg = 8'b11110010;
			4'h4 : led7seg = 8'b01100110;
			4'h5 : led7seg = 8'b10110110;
			4'h6 : led7seg = 8'b10111110;
			4'h7 : led7seg = 8'b11100100;
			4'h8 : led7seg = 8'b11111110;
			4'h9 : led7seg = 8'b11110110;
			4'hA : led7seg = 8'b11101110;
			4'hB : led7seg = 8'b00111110;
			4'hC : led7seg = 8'b00011010;
			4'hD : led7seg = 8'b01111010;
			4'hE : led7seg = 8'b10011110;
			4'hF : led7seg = 8'b10001110;
			default : led7seg = 8'b00000001;
		endcase
	end
endmodule	