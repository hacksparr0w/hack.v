`ifndef inc16
  `include "src/inc16.v"
`endif

module inc16_test;
  reg [15:0] in;
  wire [15:0] out;

  inc16 u (in, out);

  initial begin
    in = 16'b0000000000000000;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0000000000000001;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0000000000000001;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0000000000000010;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b1000000000000001;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b1010101010101010;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0101010101010101;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b1111111111111111;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0000000000000000;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b1111111100000000;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0000000011111111;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0010101010010100;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b1010010010010101;
    #1;
    assert((in + 1'b1) == out);

    in = 16'b0111111111111111;
    #1;
    assert((in + 1'b1) == out);
  end
endmodule;
