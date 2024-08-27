// Code your testbench here
// or browse Examples
   
module tb();
  reg [7:0] data_a;
  reg [7:0] data_b;
  reg [5:0] addr_a;
  reg [5:0] addr_b;
  reg clk;
  reg we_a;
  reg we_b;
  wire  [7:0] q_a;
  wire  [7:0]q_b;
    
  Dual_port_ram DUT (data_a,addr_a,we_a,
                    data_b,addr_b,we_b,clk,
                    q_a,q_b);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin 
    clk=1'b0;
    
  end
  
  always #5 clk=~clk;
  
  
  initial begin
    
      data_a = 8'h33;
      addr_a = 6'h01;
      
      data_b = 8'h44;
      addr_b = 6'h02;
      
      we_a = 1'b1;
      we_b = 1'b1;
      
      #10;
      
      data_a = 8'h55;
      addr_a = 6'h03;
      
      addr_b = 6'h01;
      
      we_b = 1'b0;
      
      #10;          
            
      addr_a = 6'h02;
      
      addr_b = 6'h03;
      
      we_a = 1'b0;
      
      #10;
      
      addr_a = 6'h01;
      
      data_b = 8'h77;
      addr_b = 6'h02;
      
      we_b = 1'b1;
      
      #30 $finish;
    
  end
  
  
  
endmodule