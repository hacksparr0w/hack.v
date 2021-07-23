`ifndef andg
  `include "src/andg.v"
`endif

`ifndef notg
  `include "src/notg.v"
`endif

`define dmux 1

module dmux (input in, input sel, output a, output b);
  wire c;

  notg g1 (sel, c);
  andg g2 (in, c, a);
  andg g3 (in, sel, b);
endmodule
