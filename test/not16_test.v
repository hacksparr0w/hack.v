`ifndef not16
  `include "src/not16.v"
`endif

module not16_test;
  reg [15:0] in;
  wire [15:0] out;

  not16 g (in, out);

  generate
    localparam start = 16'b0000000000000000;
    localparam stop = 16'b1111111111111111;
    genvar i;

    for (i = start; i <= stop; i = i + 1) begin
      initial begin
        #(i * 2);
        in = i;
        #1;
        assert(out == ~in);
      end
    end
  endgenerate
endmodule
