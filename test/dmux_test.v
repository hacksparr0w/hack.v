`ifndef dmux
  `include "src/dmux.v"
`endif

module dmux_test;
  reg in, sel;
  wire a, b;

  dmux g (in, sel, a, b);

  initial begin
    {in, sel} = 2'b00;
    #20;
    assert(a == 0);
    assert(b == 0);

    {in, sel} = 2'b01;
    #20;
    assert(a == 0);
    assert(b == 0);

    {in, sel} = 2'b10;
    #20;
    assert(a == 1);
    assert(b == 0);

    {in, sel} = 2'b11;
    #20;
    assert(a == 0);
    assert(b == 1);
  end
endmodule;
