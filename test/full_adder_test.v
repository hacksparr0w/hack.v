`ifndef full_adder
  `include "src/full_adder.v"
`endif

module full_adder_test;
  reg a, b, c;
  wire sum, carry;

  full_adder u (a, b, c, sum, carry);

  initial begin
    {a, b, c} = 3'b000;
    #1;
    assert(sum == 0);
    assert(carry == 0);

    {a, b, c} = 3'b001;
    #1;
    assert(sum == 1);
    assert(carry == 0);

    {a, b, c} = 3'b010;
    #1;
    assert(sum == 1);
    assert(carry == 0);

    {a, b, c} = 3'b011;
    #1;
    assert(sum == 0);
    assert(carry == 1);

    {a, b, c} = 3'b100;
    #1;
    assert(sum == 1);
    assert(carry == 0);

    {a, b, c} = 3'b101;
    #1;
    assert(sum == 0);
    assert(carry == 1);

    {a, b, c} = 3'b110;
    #1;
    assert(sum == 0);
    assert(carry == 1);

    {a, b, c} = 3'b111;
    #1;
    assert(sum == 1);
    assert(carry == 1);
  end
endmodule
