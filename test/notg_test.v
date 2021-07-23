`timescale 1 ns / 1 ns
`include "src/notg.v"

module notg_test;

  reg a;
  wire y;

  notg uut(a, y);

  initial begin
    a = 0;
    #20;
    assert(y == 1);

    a = 1;
    #20;
    assert(y == 0);
  end

endmodule
