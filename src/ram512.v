`ifndef dmux8way
  `include "src/dmux8way.v"
`endif

`ifndef mux8way16
  `include "src/mux8way16.v"
`endif

`ifndef ram64
  `include "src/ram64.v"
`endif

`define ram512 1

module ram512 (
  input [15:0] in,
  input [8:0] address,
  input load,
  input clk,
  output [15:0] out
);
  wire w1, w2, w3, w4, w5, w6, w7, w8;
  wire [15:0] w9, w10, w11, w12, w13, w14, w15, w16;

  dmux8way u1 (load, address[8:6], w1, w2, w3, w4, w5, w6, w7, w8);

  ram64 u2 (in, address[5:0], w1, clk, w9);
  ram64 u3 (in, address[5:0], w2, clk, w10);
  ram64 u4 (in, address[5:0], w3, clk, w11);
  ram64 u5 (in, address[5:0], w4, clk, w12);
  ram64 u6 (in, address[5:0], w5, clk, w13);
  ram64 u7 (in, address[5:0], w6, clk, w14);
  ram64 u8 (in, address[5:0], w7, clk, w15);
  ram64 u9 (in, address[5:0], w8, clk, w16);

  mux8way16 u10 (w9, w10, w11, w12, w13, w14, w15, w16, address[8:6], out);
endmodule
