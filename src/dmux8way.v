`ifndef dmux
  `include "src/dmux.v"
`endif

`ifndef dmux4way
  `include "src/dmux4way.v"
`endif

`define dmux8way 1

module dmux8way (
  input in,
  input [2:0] sel,
  output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g,
  output h
);
  wire i, j;

  dmux u1 (in, sel[2], i, j);
  dmux4way u2 (i, sel[1:0], a, b, c, d);
  dmux4way u3 (j, sel[1:0], e, f, g, h);
endmodule
