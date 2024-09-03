// Code your testbench here
// or browse Examples
//`include "ALU_B1.v"
module tb_alu;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] Op;

    // Outputs
    wire [7:0] R;

    // Instantiate the Unit Under Test (UUT)
    ALU uut ( 
        .A(A), 
        .B(B), 
        .Op(Op), 
        .R(R)
    );
    
    initial begin
        // Apply inputs.
      $monitor($time,"A=%d,B=%d,op=%d,R=%d",A,B,Op,R); 
      $dumpfile("ALU_B1.vcd"); 
      $dumpvars(0,R);
    
        A = 8'b01101010;
        B = 8'b00111011;
        Op = 0; #100;
        Op = 1; #100;
        Op = 2; #100;
        Op = 3; #100;
        Op = 4; #100;
        Op = 5; #100;
        Op = 6; #100;
        Op = 7; #100;
        
    end
      
endmodule
