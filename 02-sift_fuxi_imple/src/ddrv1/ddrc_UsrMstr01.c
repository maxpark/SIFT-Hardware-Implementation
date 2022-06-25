//55Mhz AS mode cfg clock
agdbg -jreg_w 4170016c -data 00000001
//DLL phase setting
agdbg -jreg_w 4120910c -data 55e00a0a
agdbg -jreg_w 41209110 -data 80000164

agdbg -jreg_w 41209118 -data 02020202
agdbg -jreg_w 4120911c -data 00000002
agdbg -jreg_w 41209120 -data 80808080
agdbg -jreg_w 41209124 -data 00000080
agdbg -jreg_w 41209128 -data bfbfbfbf
agdbg -jreg_w 4120912c -data 000000bf
agdbg -jreg_w 41209130 -data bfbfbfbf
agdbg -jreg_w 41209134 -data 000000bf

//x32 mode
agdbg -jreg_w 41209054 -data 00000000
agdbg -jreg_w 41209060 -data 0000777F
agdbg -jreg_w 41209068 -data 00000100
//agdbg -jreg_w 41209108 -data 0186A000
agdbg -jreg_w 41209114 -data 00000a24
//x16 reduce mode
//agdbg -jreg_w 41209054 -data 04000000
//agdbg -jreg_w 41209114 -data 000a0a24