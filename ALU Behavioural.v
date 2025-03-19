module ALU_8bit (
    input [7:0] A,       // Input A (8-bit)
    input [7:0] B,       // Input B (8-bit)
    input [2:0] Op,      // Operation code (3-bit)
    output reg [7:0] Y,  // Output Y (8-bit)
    output reg Z,        // Zero flag
    output reg C,        // Carry flag
    output reg V,        // Overflow flag
    output reg N         // Negative flag
);

    // Operation codes
    localparam ADD = 3'b000;
    localparam SUB = 3'b001;
    localparam AND = 3'b010;
    localparam OR  = 3'b011;
    localparam XOR = 3'b100;
    localparam NOT = 3'b101;

    reg [8:0] temp_result; // Temporary result with carry

    always @(*) begin
        case (Op)
            ADD: begin
                temp_result = A + B;
                Y = temp_result[7:0];
                C = temp_result[8]; // Carry flag
                V = (A[7] == B[7]) && (Y[7] != A[7]); // Overflow flag
            end
            SUB: begin
                temp_result = A - B;
                Y = temp_result[7:0];
                C = temp_result[8]; // Carry flag
                V = (A[7] != B[7]) && (Y[7] != A[7]); // Overflow flag
            end
            AND: begin
                Y = A & B;
                C = 0; // No carry for logical operations
                V = 0; // No overflow for logical operations
            end
            OR: begin
                Y = A | B;
                C = 0; // No carry for logical operations
                V = 0; // No overflow for logical operations
            end
            XOR: begin
                Y = A ^ B;
                C = 0; // No carry for logical operations
                V = 0; // No overflow for logical operations
            end
            NOT: begin
                Y = ~A;
                C = 0; // No carry for logical operations
                V = 0; // No overflow for logical operations
            end
            default: begin
                Y = 8'b0;
                C = 0;
                V = 0;
            end
        endcase

        // Zero flag
        Z = (Y == 8'b0);

        // Negative flag
        N = Y[7];
    end

endmodule
  
