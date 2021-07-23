`define nandg 1

module nandg (input a, input b, output y);
  assign y = ~a | ~b;
endmodule
