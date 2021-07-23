`ifndef or16
  `include "src/or16.v"
`endif

module or16_test;
  reg [15:0] a;
  reg [15:0] b;
  wire [15:0] out;

  or16 g (a, b, out);

  generate
    genvar i;
    genvar j;

    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        initial begin
          #(2 * 16 * i + 2 * j);
          a = 2 ** i;
          b = 2 ** j;

          #1;
          assert((a | b) == out);
        end
      end
    end
  endgenerate
endmodule
