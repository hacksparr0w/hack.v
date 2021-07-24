`ifndef bitg
  `include "src/bitg.v"
`endif

`define reg16 1

module reg16 (input [15:0] in, input load, input clk, output [15:0] out);
  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      bitg u (in[i], load, clk, out[i]);
    end
  endgenerate
endmodule
