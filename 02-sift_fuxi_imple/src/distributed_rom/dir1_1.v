`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir1_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module dir1_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1a;
            001: spo = 5'h19;
            002: spo = 5'h19;
            003: spo = 5'h19;
            004: spo = 5'h19;
            005: spo = 5'h19;
            006: spo = 5'h18;
            007: spo = 5'h18;
            008: spo = 5'h18;
            009: spo = 5'h18;
            010: spo = 5'h18;
            011: spo = 5'h18;
            012: spo = 5'h17;
            013: spo = 5'h17;
            014: spo = 5'h17;
            015: spo = 5'h17;
            016: spo = 5'h1a;
            017: spo = 5'h1a;
            018: spo = 5'h1a;
            019: spo = 5'h1a;
            020: spo = 5'h1a;
            021: spo = 5'h1a;
            022: spo = 5'h19;
            023: spo = 5'h19;
            024: spo = 5'h19;
            025: spo = 5'h19;
            026: spo = 5'h19;
            027: spo = 5'h19;
            028: spo = 5'h18;
            029: spo = 5'h18;
            030: spo = 5'h18;
            031: spo = 5'h18;
            032: spo = 5'h1b;
            033: spo = 5'h1b;
            034: spo = 5'h1b;
            035: spo = 5'h1b;
            036: spo = 5'h1b;
            037: spo = 5'h1b;
            038: spo = 5'h1a;
            039: spo = 5'h1a;
            040: spo = 5'h1a;
            041: spo = 5'h1a;
            042: spo = 5'h1a;
            043: spo = 5'h1a;
            044: spo = 5'h19;
            045: spo = 5'h19;
            046: spo = 5'h19;
            047: spo = 5'h19;
            048: spo = 5'h1c;
            049: spo = 5'h1c;
            050: spo = 5'h1c;
            051: spo = 5'h1c;
            052: spo = 5'h1c;
            053: spo = 5'h1c;
            054: spo = 5'h1b;
            055: spo = 5'h1b;
            056: spo = 5'h1b;
            057: spo = 5'h1b;
            058: spo = 5'h1b;
            059: spo = 5'h1b;
            060: spo = 5'h1a;
            061: spo = 5'h1a;
            062: spo = 5'h1a;
            063: spo = 5'h1a;
            064: spo = 5'h1d;
            065: spo = 5'h1d;
            066: spo = 5'h1d;
            067: spo = 5'h1d;
            068: spo = 5'h1d;
            069: spo = 5'h1d;
            070: spo = 5'h1c;
            071: spo = 5'h1c;
            072: spo = 5'h1c;
            073: spo = 5'h1c;
            074: spo = 5'h1c;
            075: spo = 5'h1c;
            076: spo = 5'h1b;
            077: spo = 5'h1b;
            078: spo = 5'h1b;
            079: spo = 5'h1b;
            080: spo = 5'h1e;
            081: spo = 5'h1e;
            082: spo = 5'h1e;
            083: spo = 5'h1e;
            084: spo = 5'h1e;
            085: spo = 5'h1e;
            086: spo = 5'h1d;
            087: spo = 5'h1d;
            088: spo = 5'h1d;
            089: spo = 5'h1d;
            090: spo = 5'h1d;
            091: spo = 5'h1d;
            092: spo = 5'h1c;
            093: spo = 5'h1c;
            094: spo = 5'h1c;
            095: spo = 5'h1c;
            096: spo = 5'h1f;
            097: spo = 5'h1f;
            098: spo = 5'h1f;
            099: spo = 5'h1f;
            100: spo = 5'h1f;
            101: spo = 5'h1f;
            102: spo = 5'h1e;
            103: spo = 5'h1e;
            104: spo = 5'h1e;
            105: spo = 5'h1e;
            106: spo = 5'h1e;
            107: spo = 5'h1e;
            108: spo = 5'h1d;
            109: spo = 5'h1d;
            110: spo = 5'h1d;
            111: spo = 5'h1d;
            112: spo = 5'h0;
            113: spo = 5'h0;
            114: spo = 5'h0;
            115: spo = 5'h0;
            116: spo = 5'h0;
            117: spo = 5'h0;
            118: spo = 5'h1f;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1f;
            123: spo = 5'h1e;
            124: spo = 5'h1e;
            125: spo = 5'h1e;
            126: spo = 5'h1e;
            127: spo = 5'h1e;
            128: spo = 5'h1;
            129: spo = 5'h1;
            130: spo = 5'h1;
            131: spo = 5'h1;
            132: spo = 5'h1;
            133: spo = 5'h1;
            134: spo = 5'h0;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h0;
            139: spo = 5'h1f;
            140: spo = 5'h1f;
            141: spo = 5'h1f;
            142: spo = 5'h1f;
            143: spo = 5'h1f;
            144: spo = 5'h2;
            145: spo = 5'h2;
            146: spo = 5'h2;
            147: spo = 5'h2;
            148: spo = 5'h2;
            149: spo = 5'h2;
            150: spo = 5'h1;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h1;
            155: spo = 5'h0;
            156: spo = 5'h0;
            157: spo = 5'h0;
            158: spo = 5'h0;
            159: spo = 5'h0;
            160: spo = 5'h3;
            161: spo = 5'h3;
            162: spo = 5'h3;
            163: spo = 5'h3;
            164: spo = 5'h3;
            165: spo = 5'h2;
            166: spo = 5'h2;
            167: spo = 5'h2;
            168: spo = 5'h2;
            169: spo = 5'h2;
            170: spo = 5'h2;
            171: spo = 5'h1;
            172: spo = 5'h1;
            173: spo = 5'h1;
            174: spo = 5'h1;
            175: spo = 5'h1;
            176: spo = 5'h4;
            177: spo = 5'h4;
            178: spo = 5'h4;
            179: spo = 5'h4;
            180: spo = 5'h4;
            181: spo = 5'h3;
            182: spo = 5'h3;
            183: spo = 5'h3;
            184: spo = 5'h3;
            185: spo = 5'h3;
            186: spo = 5'h3;
            187: spo = 5'h2;
            188: spo = 5'h2;
            189: spo = 5'h2;
            190: spo = 5'h2;
            191: spo = 5'h2;
            192: spo = 5'h5;
            193: spo = 5'h5;
            194: spo = 5'h5;
            195: spo = 5'h5;
            196: spo = 5'h5;
            197: spo = 5'h4;
            198: spo = 5'h4;
            199: spo = 5'h4;
            200: spo = 5'h4;
            201: spo = 5'h4;
            202: spo = 5'h4;
            203: spo = 5'h3;
            204: spo = 5'h3;
            205: spo = 5'h3;
            206: spo = 5'h3;
            207: spo = 5'h3;
            208: spo = 5'h6;
            209: spo = 5'h6;
            210: spo = 5'h6;
            211: spo = 5'h6;
            212: spo = 5'h6;
            213: spo = 5'h5;
            214: spo = 5'h5;
            215: spo = 5'h5;
            216: spo = 5'h5;
            217: spo = 5'h5;
            218: spo = 5'h5;
            219: spo = 5'h4;
            220: spo = 5'h4;
            221: spo = 5'h4;
            222: spo = 5'h4;
            223: spo = 5'h4;
            224: spo = 5'h7;
            225: spo = 5'h7;
            226: spo = 5'h7;
            227: spo = 5'h7;
            228: spo = 5'h7;
            229: spo = 5'h6;
            230: spo = 5'h6;
            231: spo = 5'h6;
            232: spo = 5'h6;
            233: spo = 5'h6;
            234: spo = 5'h6;
            235: spo = 5'h5;
            236: spo = 5'h5;
            237: spo = 5'h5;
            238: spo = 5'h5;
            239: spo = 5'h5;
            240: spo = 5'h8;
            241: spo = 5'h8;
            242: spo = 5'h8;
            243: spo = 5'h8;
            244: spo = 5'h8;
            245: spo = 5'h7;
            246: spo = 5'h7;
            247: spo = 5'h7;
            248: spo = 5'h7;
            249: spo = 5'h7;
            250: spo = 5'h7;
            251: spo = 5'h6;
            252: spo = 5'h6;
            253: spo = 5'h6;
            254: spo = 5'h6;
            255: spo = 5'h6;
            default: spo = 5'h0;
		endcase
	end
endmodule