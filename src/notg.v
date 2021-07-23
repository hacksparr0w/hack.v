`ifndef nandg
  `include "src/nandg.v"
`endif

`define notg 1

module notg (input a, output y);
  nandg g (a, a, y);
endmodule
