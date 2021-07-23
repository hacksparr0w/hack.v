`timescale 1 ns / 1 ns
`include "src/nandg.v"

module nandg_test;

  reg a, b;
  wire y;

  nandg uut(a, b, y);

  initial begin
    {a, b} = 2'b00;
    #20;
    assert(y == 1);

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
