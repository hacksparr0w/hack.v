`ifndef half_adder
  `include "src/half_adder.v"
`endif

module half_adder_test;
  reg a, b;
  wire sum, carry;

  half_adder u (a, b, sum, carry);

  initial begin
    {a, b} = 2'b00;
    #1;
    assert(sum == 0);
    assert(carry == 0);

    {a, b} = 2'b01;
    #1;
    assert(sum == 1);
    assert(carry == 0);

    {a, b} = 2'b10;
    #1;
    assert(sum == 1);
    assert(carry == 0);

    {a, b} = 2'b11;
    #1;
    assert(sum == 0);
    assert(carry == 1);
  end
endmodule
