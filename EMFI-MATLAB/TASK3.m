function [K10] = TASK3(C1, C2, D1, D2)
 D1 = hex2dec(reshape(D1, 2, [])');
 D2 = hex2dec(reshape(D2, 2, [])');

 C1 = hex2dec(reshape(C1, 2, [])');
 C2 = hex2dec(reshape(C2, 2, [])');

 D1 = reshape(D1, 4, []);
 D2 = reshape(D2, 4, []);
 C1 = reshape(C1, 4, []);
 C2 = reshape(C2, 4, []);

 RHS = ShiftRows(MixColumns(bitxor(D1, D2)));

 K10 = repmat(-1 , 1, 16); 
 for byte = 1:16
 for K10_hyp = 0:255
 res1 = bitxor(C1(byte), K10_hyp);
 res2 = bitxor(C2(byte), K10_hyp);

 res1 = InvSubBytes(res1);
 res2 = InvSubBytes(res2);

 LHS = bitxor(res1, res2);
 if (LHS == RHS(byte))
 K10(byte) = K10_hyp;
 end
 end
 end
end