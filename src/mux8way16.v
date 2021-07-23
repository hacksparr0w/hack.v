`ifndef mux4way16
  `include "src/mux4way16.v"
`endif

`ifndef mux16
  `include "src/mux16.v"
`endif

`define mux8way16 1

module mux8way16 (
  input [15:0] a,
  input [15:0] b,
  input [15:0] c,
  input [15:0] d,
  input [15:0] e,
  input [15:0] f,
  input [15:0] g,
  input [15:0] h,
  input [2:0] sel,
  output [15:0] out
);
  wire [15:0] i, j;

  mux4way16 g1 (a, b, c, d, sel[1:0], i);
  mux4way16 g2 (e, f, g, h, sel[1:0], j);
  mux16 g3 (i, j, sel[2], out);
endmodule
