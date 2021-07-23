`ifndef org
  `include "src/org.v"
`endif

`define or8way

module or8way (input [7:0] in, output out);
  wire a, b, c, d, e, f;

  org g1 (in[0], in[1], a);
  org g2 (a, in[2], b);
  org g3 (b, in[3], c);
  org g4 (c, in[4], d);
  org g5 (d, in[5], e);
  org g6 (e, in[6], f);
  org g7 (f, in[7], out);
endmodule
