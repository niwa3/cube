//zf.v
//$B%U%i%04IM}!$$"$^$j0UL#$O$J$$(B
module zf(rst_n, zfin, zfout);
	input wire rst_n;
	input wire zfin;
	output reg zfout;

always @(*) begin
	if(!rst_n)begin
		zfout <= 0;
	end else begin
		zfout <= zfin;
	end
end

endmodule
