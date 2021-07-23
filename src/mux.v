`ifndef andg
  `include "src/andg.v"
`endif

`ifndef notg
  `include "src/notg.v"
`endif

`ifndef org
  `include "src/org.v"
`endif

`define mux 1

module mux (input a, input b, input sel, output out);
  wire c, d, e, f, g;

  notg g1 (sel, c);

  andg g2 (a, b, d);
  andg g3 (a, c, e);
  andg g4 (b, sel, f);

  org g5 (d, e, g);
  org g6 (g, f, out);
endmodule;
