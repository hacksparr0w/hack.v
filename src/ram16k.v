`ifndef dmux4way
  `include "src/dmux4way.v"
`endif

`ifndef mux4way16
  `include "src/mux4way16.v"
`endif

`ifndef ram4k
  `include "src/ram4k.v"
`endif

`define ram16k 1

module ram16k (
  input [15:0] in,
  input [13:0] address,
  input load,
  input clk,
  output [15:0] out
);
  wire w1, w2, w3, w4;
  wire [15:0] w5, w6, w7, w8;

  dmux4way u1 (load, address[13:12], w1, w2, w3, w4);

  ram4k u2 (in, address[11:0], w1, clk, w5);
  ram4k u3 (in, address[11:0], w2, clk, w6);
  ram4k u4 (in, address[11:0], w3, clk, w7);
  ram4k u5 (in, address[11:0], w4, clk, w8);

  mux4way16 u6 (w5, w6, w7, w8, address[13:12], out);
endmodule
