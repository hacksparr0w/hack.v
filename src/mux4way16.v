`ifndef mux16
  `include "src/mux16.v"
`endif

`define mux4way16 1

module mux4way16 (
  input [15:0] a,
  input [15:0] b,
  input [15:0] c,
  input [15:0] d,
  input [1:0] sel,
  output [15:0] out
);
  wire [15:0] f, g;

  mux16 g2 (a, b, sel[0], f);
  mux16 g3 (c, d, sel[0], g);
  mux16 g4 (f, g, sel[1], out);
endmodule
