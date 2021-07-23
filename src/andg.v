`ifndef nandg
  `include "src/nandg.v"
`endif
`ifndef notg
  `include "src/notg.v"
`endif

`define andg 1

module andg (input a, input b, output y);
  wire c;

  nandg g1 (a, b, c);
  notg g2 (c, y);
endmodule
