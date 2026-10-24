`timescale 1ns / 1ps
module mux512(
input [511:0] I,
input [8:0] S,
output Y);
wire [127:0] W1;wire [31:0] W2;wire [7:0] W3;wire [1:0] W4;
genvar i;
generate 
   for (i=0;i<128;i=i+1) begin :STAGE1              // stage 1 512 -> 128;
        mux4 M1(
         .I(I[i*4 +: 4]),
         .S(S[1:0]),
         .Y(W1[i])
        );
    end
// stage 128 -> 32 
   for(i = 0; i < 32; i = i + 1) begin : STAGE2
       mux4 M2(
        .I(W1[i*4 +: 4]),
        .S(S[3:2]),
        .Y(W2[i])
         );
    end
// stage 32 -> 8 
     for(i = 0; i < 8; i = i + 1) begin : STAGE3
         mux4 M3 (
           .I(W2[i*4 +: 4]),
           .S(S[5:4]),
           .Y(W3[i])
             );
          end
// stage 4 8 ->2
        for(i = 0; i < 2; i = i + 1) begin : STAGE4
             mux4 M4(
              .I(W3[i*4 +: 4]),
              .S(S[7:6]),
              .Y(W4[i])
              );
         end
        mux2 M5(
           .I(W4),
            .S(S[8]),
            .Y(Y)
             );
endgenerate 
endmodule


   