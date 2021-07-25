`ifndef dmux8way
  `include "src/dmux8way.v"
`endif

`ifndef mux8way16
  `include "src/mux8way16.v"
`endif

`ifndef ram8
  `include "src/ram8.v"
`endif

`define ram64 1

module ram64 (
  input [15:0] in,
  input [5:0] address,
  input load,
  input clk,
  output [15:0] out
);
  wire w1, w2, w3, w4, w5, w6, w7, w8;
  wire [15:0] w9, w10, w11, w12, w13, w14, w15, w16;

  dmux8way u (load, address[5:3], w1, w2, w3, w4, w5, w6, w7, w8);

  ram8 u2 (in, address[2:0], w1, clk, w9);
  ram8 u3 (in, address[2:0], w2, clk, w10);
  ram8 u4 (in, address[2:0], w3, clk, w11);
  ram8 u5 (in, address[2:0], w4, clk, w12);
  ram8 u6 (in, address[2:0], w5, clk, w13);
  ram8 u7 (in, address[2:0], w6, clk, w14);
  ram8 u8 (in, address[2:0], w7, clk, w15);
  ram8 u9 (in, address[2:0], w8, clk, w16);

  mux8way16 u10 (w9, w10, w11, w12, w13, w14, w15, w16, address[5:3], out);
endmodule
