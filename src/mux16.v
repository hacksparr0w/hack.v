`ifndef mux
  `include "src/mux.v"
`endif

`define mux16 1

module mux16 (input [15:0] a, input [15:0] b, input sel, output [15:0] out);
  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      mux g (a[i], b[i], sel, out[i]);
    end
  endgenerate
endmodule;
