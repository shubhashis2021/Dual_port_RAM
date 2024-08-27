// Code your design here
module Dual_port_ram( input [7:0] data_a,input [5:0]addr_a,input we_a,
                     input [7:0]data_b,input [5:0]addr_b,input we_b,input clk,
                     output reg [7:0]q_a, output reg [7:0]q_b);
  
 // reg [7:0] q_a,q_b;
  
  
  reg [7:0]ram[63:0];
  //reg add_reg_a[5:0];
  //reg add_reg_b[5:0];
  
  always @(posedge clk) begin
  
    if(we_a) ram[addr_a]<=data_a;
    else q_a<=ram[addr_a];
  end
 
  
  always @(posedge clk) begin
  
    if(we_b) ram[addr_b]<=data_b;
    else q_b<=ram[addr_b];

  end
  
 // assign q_a<=ram[add_reg_a];
  //assign q_b<=ram[add_reg_b];
  
  endmodule