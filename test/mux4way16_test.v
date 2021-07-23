`ifndef mux4way16
  `include "src/mux4way16.v"
`endif

module mux4way16_test;
  reg [15:0] a;
  reg [15:0] b;
  reg [15:0] c;
  reg [15:0] d;
  reg [1:0] sel;
  wire [15:0] out;

  mux4way16 g (a, b, c, d, sel, out);

  initial begin
    a = 16'b0101010100000000;
    b = 16'b1010101000000000;
    c = 16'b0000000001010101;
    d = 16'b0000000010101010;
    sel = 2'b00;
    #1;
    assert(out == a);

    sel = 2'b01;
    #1;
    assert(out == b);

    sel = 2'b10;
    #1;
    assert(out == c);

    sel = 2'b11;
    #1
    assert(out == d);
  end
endmodule
