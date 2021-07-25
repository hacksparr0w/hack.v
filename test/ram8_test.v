`ifndef ram8
  `include "src/ram8.v"
`endif

module ram8_test;
  reg [15:0] in;
  reg [2:0] address;
  reg load, clk;
  wire [15:0] out;

  ram8 u (in, address, load, clk, out);

  initial begin
    in <= 16'b0000000000000001;
    address <= 3'b000;
    load <= 1;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000001);

    #1;
    in <= 16'b0000000000000010;
    address <= 3'b001;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000010);

    #1;
    in <= 16'b0000000000000011;
    address <= 3'b010;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000011);

    #1;
    in <= 16'b0000000000000100;
    address <= 3'b011;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000100);

    #1;
    in <= 16'b0000000000000101;
    address <= 3'b100;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000101);

    #1;
    in <= 16'b0000000000000110;
    address <= 3'b101;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000110);

    #1;
    in <= 16'b0000000000000111;
    address <= 3'b110;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000000111);

    #1;
    in <= 16'b0000000000001000;
    address <= 3'b111;
    clk <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b0000000000001000);

    #1;
    in <= 16'b0000000000000000;
    address <= 3'b000;
    load <= 0;
    clk <= 0;

    #1;
    assert(out == 16'b0000000000000001);

    #1;
    address <= 3'b001;

    #1;
    assert(out == 16'b0000000000000010);

    #1;
    address <= 3'b010;

    #1;
    assert(out == 16'b0000000000000011);

    #1;
    address <= 3'b011;

    #1;
    assert(out == 16'b0000000000000100);

    #1;
    address <= 3'b100;

    #1;
    assert(out == 16'b0000000000000101);

    #1;
    address <= 3'b101;

    #1;
    assert(out == 16'b0000000000000110);

    #1;
    address <= 3'b110;

    #1;
    assert(out == 16'b0000000000000111);

    #1;
    address <= 3'b111;

    #1;
    assert(out == 16'b0000000000001000);
  end
endmodule
