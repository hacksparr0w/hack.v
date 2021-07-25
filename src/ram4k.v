`ifndef dmux8way
  `include "src/dmux8way.v"
`endif

`ifndef mux8way16
  `include "src/mux8way16.v"
`endif

`ifndef ram512_optimized
  `include "src/ram512_optimized.v"
`endif

`define ram4k 1

module ram4k (
  input [15:0] in,
  input [11:0] address,
  input load,
  input clk,
  output [15:0] out
);
  wire w1, w2, w3, w4, w5, w6, w7, w8;
  wire [15:0] w9, w10, w11, w12, w13, w14, w15, w16;

  dmux8way u1 (load, address[11:9], w1, w2, w3, w4, w5, w6, w7, w8);

  ram512_optimized u2 (in, address[8:0], w1, clk, w9);
  ram512_optimized u3 (in, address[8:0], w2, clk, w10);
  ram512_optimized u4 (in, address[8:0], w3, clk, w11);
  ram512_optimized u5 (in, address[8:0], w4, clk, w12);
  ram512_optimized u6 (in, address[8:0], w5, clk, w13);
  ram512_optimized u7 (in, address[8:0], w6, clk, w14);
  ram512_optimized u8 (in, address[8:0], w7, clk, w15);
  ram512_optimized u9 (in, address[8:0], w8, clk, w16);

  mux8way16 u10 (w9, w10, w11, w12, w13, w14, w15, w16, address[11:9], out);
endmodule
