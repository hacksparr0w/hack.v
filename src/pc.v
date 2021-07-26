`ifndef inc16
  `include "src/inc16.v"
`endif

`ifndef mux16
  `include "src/mux16.v"
`endif

`ifndef notg
  `include "src/notg.v"
`endif

`ifndef org
  `include "src/org.v"
`endif

`ifndef reg16
  `include "src/reg16.v"
`endif

`define pc 1

module pc (
  input [15:0] in,
  input inc,
  input load,
  input reset,
  input clk,
  output [15:0] out
);
  // `~reset` and `~reset` wired out into 16-bit bus. This is used to generate
  // the `16'b0000000000000000` input for the reset state

  wire w1;
  wire [15:0] w2;

  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      assign w2[i] = w1;
    end
  endgenerate

  notg u1 (reset, w1);

  // `inc | load | reset`, used as a `load` input into the `reg16` chip - if
  // either of the inputs is `1`, the register should change its internal value
  // on the next clock cycle

  wire w3, w4;

  org u2 (inc, load, w3);
  org u3 (w3, reset, w4);

  // Two multiplexors, deciding what to forward into the register. `w5` will
  // be connected into an `inc16` later

  wire [15:0] w5, w6, w7;

  mux16 u4 (w5, w2, reset, w6);
  mux16 u5 (w6, in, load, w7);

  // The `reg16` wiring

  reg16 u6 (w7, w4, clk, out);

  // The `inc16` wiring

  inc16 u7 (out, w5);
endmodule
