module adder4(
	input [3:0] a, b,
	input cin,
	output [3:0] sum,
	output cout,
	output gnd = 1'b0);

	assign {cout, sum} = a + b + cin;
endmodule