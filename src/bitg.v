`ifndef dff
  `include "src/dff.v"
`endif

`ifndef mux
  `include "src/mux.v"
`endif

`define bitg 1

module bitg (input in, input load, input clk, output out);
  wire w;

  mux u1 (out, in, load, w);
  dff u2 (w, clk, out);
endmodule
