`timescale 1ns / 1ps
module mux_512_tb;
reg [511:0]  I;
reg [8:0] S;
wire Y;
mux512 UUT(
.I(I),
.S(S),
.Y(Y)
);
integer i;
initial begin
I = 512'b0;
I[123] = 1'b1;
for(i = 0; i < 512; i = i + 1) begin      
      S = i;
       #15;
end
$finish;
end
endmodule
