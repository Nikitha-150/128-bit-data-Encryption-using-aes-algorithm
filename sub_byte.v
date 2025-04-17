`timescale 1ns / 1ps

module sub_byte(in_key, out_key);
input [127:0] in_key;
output [127:0] out_key;

// Properly indexing bytes for S-box substitution
sbox sb0 (in_key[127:120], out_key[127:120]);
sbox sb1 (in_key[119:112], out_key[119:112]);
sbox sb2 (in_key[111:104], out_key[111:104]);
sbox sb3 (in_key[103:96], out_key[103:96]);

sbox sb4 (in_key[95:88], out_key[95:88]);
sbox sb5 (in_key[87:80], out_key[87:80]);
sbox sb6 (in_key[79:72], out_key[79:72]);
sbox sb7 (in_key[71:64], out_key[71:64]);

sbox sb8 (in_key[63:56], out_key[63:56]);
sbox sb9 (in_key[55:48], out_key[55:48]);
sbox sb10 (in_key[47:40], out_key[47:40]);
sbox sb11 (in_key[39:32], out_key[39:32]);

sbox sb12 (in_key[31:24], out_key[31:24]);
sbox sb13 (in_key[23:16], out_key[23:16]);
sbox sb14 (in_key[15:8], out_key[15:8]);
sbox sb15 (in_key[7:0], out_key[7:0]);

endmodule
