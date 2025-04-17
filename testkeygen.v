module key_gen(
    input [127:0] temp_key, 
    input [127:0] mx_key, 
    input [31:0] rcon, 
    output [127:0] ko, 
    output [127:0] r_key
);
// ShiftRows (RotWord) Operation
wire [127:0] key;
assign key[95:0]    = temp_key[95:0];
assign key[127:120] = temp_key[103:96];  // Rotate left
assign key[119:112] = temp_key[127:120];
assign key[111:104] = temp_key[119:112];
assign key[103:96]  = temp_key[111:104];

// SubBytes Operation using S-Box
wire [127:0] key2;
sbox s1 (.in(key[103:96]), .out(key2[103:96]));
sbox s2 (.in(key[111:104]), .out(key2[111:104]));
sbox s3 (.in(key[119:112]), .out(key2[119:112]));
sbox s4 (.in(key[127:120]), .out(key2[127:120]));
// XOR with RCON and previous columns
assign ko[31:0]   = key2[127:96] ^ temp_key[31:0] ^ rcon;
assign ko[63:32]  = ko[31:0] ^ temp_key[63:32];
assign ko[95:64]  = ko[63:32] ^ temp_key[95:64];
assign ko[127:96] = ko[95:64] ^ temp_key[127:96];

// Final Key Output (AddRoundKey Step)
assign r_key = mx_key ^ ko;

endmodule
