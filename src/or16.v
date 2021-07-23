`ifndef org
  `include "src/org.v"
`endif

`define or16 1

module or16 (input [15:0] a, input [15:0] b, output [15:0] out);
  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      org g (a[i], b[i], out[i]);
    end
  endgenerate
endmodule
