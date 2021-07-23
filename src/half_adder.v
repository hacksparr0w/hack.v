`ifndef andg
  `include "src/andg.v"
`endif

`ifndef xorg
  `include "src/xorg.v"
`endif

`define half_adder 1

module half_adder (input a, input b, output sum, output carry);
  xorg u1 (a, b, sum);
  andg u2 (a, b, carry);
endmodule
