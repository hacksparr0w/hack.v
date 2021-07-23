`ifndef dmux4way
  `include "src/dmux4way.v"
`endif

module dmux4way_test;
  reg in;
  reg [1:0] sel;
  wire a, b, c, d;

  dmux4way u (in, sel, a, b, c, d);

  initial begin
    in = 1;
    sel = 2'b00;
    #1;
    assert(a == 1);
    assert(b == 0);
    assert(c == 0);
    assert(d == 0);

    sel = 2'b01;
    #1;
    assert(a == 0);
    assert(b == 1);
    assert(c == 0);
    assert(d == 0);

    sel = 2'b10;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 1);
    assert(d == 0);

    sel = 2'b11;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 0);
    assert(d == 1);
  end
endmodule
