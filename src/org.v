`ifndef nandg
  `include "src/nandg.v"
`endif

`define org 1

module org (input a, input b, output y);
  wire c, d;

  nandg g1 (a, a, c);
  nandg g2 (b, b, d);
  nandg g3 (c, d, y);
endmodule;
