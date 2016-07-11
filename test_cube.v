//test.v
`timescale 1ps/1ps

module test;
	reg clk, rst_n;
	wire [7:0] mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27,mem28,mem29,mem30;

	top t0(clk,rst_n,mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27,mem28,mem29,mem30);

	always #0.5 clk = ~clk;

	initial begin
		$dumpfile("test_cube.vcd");
		$dumpvars(0, t0);
		$dumplimit(1000000);
		$monitor($stime,,"mem20:%d mem21:%d mem22:%d mem23:%d mem24:%d mem25:%d mem26:%d mem27:%d mem28:%d mem29:%d mem30:%d", mem20,mem21,mem22,mem23,mem24,mem25,mem26,mem27,mem28,mem29,mem30);
		clk=0;
		rst_n=1;
	#5
		rst_n=0;
	#5
		rst_n=1;
	#2000000000000

$finish;
	end
endmodule

