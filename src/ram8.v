`ifndef dmux8way
  `include "src/dmux8way.v"
`endif

`ifndef mux8way16
  `include "src/mux8way16.v"
`endif

`ifndef reg16
  `include "src/reg16.v"
`endif

`define ram8 1

module ram8 (
  input [15:0] in,
  input [2:0] address,
  input load,
  input clk,
  output [15:0] out
);
  wire w1, w2, w3, w4, w5, w6, w7, w8;
  wire [15:0] w9, w10, w11, w12, w13, w14, w15, w16;

  dmux8way u1 (load, address, w1, w2, w3, w4, w5, w6, w7, w8);

  reg16 u2 (in, w1, clk, w9);
  reg16 u3 (in, w2, clk, w10);
  reg16 u4 (in, w3, clk, w11);
  reg16 u5 (in, w4, clk, w12);
  reg16 u6 (in, w5, clk, w13);
  reg16 u7 (in, w6, clk, w14);
  reg16 u8 (in, w7, clk, w15);
  reg16 u9 (in, w8, clk, w16);

  mux8way16 u10 (w9, w10, w11, w12, w13, w14, w15, w16, address, out);
endmodule
