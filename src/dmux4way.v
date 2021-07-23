`ifndef dmux
  `include "src/dmux.v"
`endif

`define dmux4way 1

module dmux4way (
  input in,
  input [1:0] sel,
  output a,
  output b,
  output c,
  output d
);
  wire e, f;

  dmux u1 (in, sel[1], e, f);
  dmux u2 (e, sel[0], a, b);
  dmux u3 (f, sel[0], c, d);
endmodule
