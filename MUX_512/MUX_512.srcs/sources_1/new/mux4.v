`timescale 1ns / 1ps
module mux4(
input [3:0] I,
input [1:0] S,
output Y
);
assign Y = I[S];
endmodule

