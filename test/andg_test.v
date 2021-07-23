`ifndef andg
  `include "src/andg.v"
`endif

module andg_test;
  reg a, b;
  wire y;

  andg g (a, b, y);

  initial begin
    {a, b} = 2'b00;
    #20;
    assert(y == 0);

    {a, b} = 2'b01;
    #20;
    assert(y == 0);

    {a, b} = 2'b10;
    #20;
    assert(y == 0);

    {a, b} = 2'b11;
    #20;
    assert(y == 1);
  end
endmodule;
