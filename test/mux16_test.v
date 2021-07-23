`ifndef mux16
  `include "src/mux16.v"
`endif

module mux16_test;
  reg [15:0] a;
  reg [15:0] b;
  reg sel;
  wire [15:0] out;

  mux16 g (a, b, sel, out);

  initial begin
    a = 16'b0101010101010101;
    b = 16'b1010101010101010;
    sel = 0;
    #1;
    assert(out == a);

    sel = 1;
    #1;
    assert(out == b);
  end
endmodule
