`ifndef andg
  `include "src/andg.v"
`endif

`define and16 1

module and16 (input [15:0] a, input [15:0] b, output [15:0] out);
  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      andg g (a[i], b[i], out[i]);
    end
  endgenerate
endmodule
