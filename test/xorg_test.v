`ifndef xorg
  `include "src/xorg.v"
`endif

module xorg_test;
  reg a, b;
  wire y;

  xorg g (a, b, y);

  initial begin
    {a, b} = 2'b00;
    #20;
    assert(y == 0);

    {a, b} = 2'b01;
    #20;
    assert(y == 1);

    {a, b} = 2'b10;
    #20;
    assert(y == 1);

    {a, b} = 2'b11;
    #20;
    assert(y == 0);
  end
endmodule
