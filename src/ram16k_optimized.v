`define ram16k_optimized 1

module ram16k_optimized (
  input [15:0] in,
  input [13:0] address,
  input load,
  input clk,
  output [15:0] out
);
  reg[15:0] memory[0:16383];

  assign out = memory[address];

  always @(posedge clk) begin
    if (load) memory[address] <= in;
  end
endmodule
