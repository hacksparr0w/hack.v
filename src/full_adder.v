`ifndef half_adder
  `include "src/half_adder.v"
`endif

`ifndef org
  `include "src/org.v"
`endif

`define full_adder 1

module full_adder (input a, input b, input c, output sum, output carry);
  wire d, e, f;

  half_adder u1 (a, b, d, e);
  half_adder u2 (c, d, sum, f);
  org u3 (e, f, carry);
endmodule
