`ifndef nandg
  `include "src/nandg.v"
`endif

`define xorg 1

module xorg (input a, input b, output y);
  wire c, d, e;

  nandg g1 (a, b, c);
  nandg g2 (a, c, d);
  nandg g3 (b, c, e);
  nandg g4 (d, e, y);
endmodule
