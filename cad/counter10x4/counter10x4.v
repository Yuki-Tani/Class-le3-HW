module counter10x4(
	input clock,
	input start_stop,
	output [7:0] LED,
	output [3:0] selecters,
	output overflow);
	
	wire CKx2p16,CKx4;
	wire plus;
	wire ov[0:2];
	wire [3:0] num[0:3];
	wire [7:0] digitLED[0:3];
	
	reg start_stop_RMch = 0;
	reg run = 1;
	
	counter2p16 dev(.clock(clock),.overflow(CKx2p16));
	counter4 dev2(.clock(clock),.overflow(CKx4));
	
	always @(posedge CKx2p16)
	begin
		start_stop_RMch <= start_stop;
	end
	
	always @(posedge start_stop_RMch)
	begin
		run <= (run==1)?0:1;
	end
	
	assign plus = CKx2p16 & run;
	
	counter10 c0(.clock(plus),.overflow(ov[0]),.count(num[0]));
	counter10 c1(.clock(ov[0]),.overflow(ov[1]),.count(num[1]));
	counter10 c2(.clock(ov[1]),.overflow(ov[2]),.count(num[2]));
	counter10 c3(.clock(ov[2]),.overflow(overflow),.count(num[3]));
	
	LED7segDecoder d0(.number(num[0]),.led7seg(digitLED[0]));
	LED7segDecoder d1(.number(num[1]),.led7seg(digitLED[1]));
	LED7segDecoder d2(.number(num[2]),.led7seg(digitLED[2]));
	LED7segDecoder d3(.number(num[3]),.led7seg(digitLED[3]));
	
	LED4set gath(.CKx4(CKx4),.LED3(digitLED[3]),.LED2(digitLED[2]),.LED1(digitLED[1]),.LED0(digitLED[0]),
					.LED(LED),.selecters(selecters));
	
endmodule