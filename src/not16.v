`ifndef notg
  `include "src/notg.v"
`endif

`define not16 1

module not16 (input [15:0] in, output [15:0] out);
  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      notg g (in[i], out[i]);
    end
  endgenerate
endmodule
