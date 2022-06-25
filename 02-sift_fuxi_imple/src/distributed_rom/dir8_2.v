`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir8_2 
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

module dir8_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h17;
            001: spo = 5'h17;
            002: spo = 5'h17;
            003: spo = 5'h17;
            004: spo = 5'h17;
            005: spo = 5'h18;
            006: spo = 5'h18;
            007: spo = 5'h18;
            008: spo = 5'h18;
            009: spo = 5'h18;
            010: spo = 5'h18;
            011: spo = 5'h19;
            012: spo = 5'h19;
            013: spo = 5'h19;
            014: spo = 5'h19;
            015: spo = 5'h19;
            016: spo = 5'h18;
            017: spo = 5'h18;
            018: spo = 5'h18;
            019: spo = 5'h18;
            020: spo = 5'h18;
            021: spo = 5'h19;
            022: spo = 5'h19;
            023: spo = 5'h19;
            024: spo = 5'h19;
            025: spo = 5'h19;
            026: spo = 5'h19;
            027: spo = 5'h1a;
            028: spo = 5'h1a;
            029: spo = 5'h1a;
            030: spo = 5'h1a;
            031: spo = 5'h1a;
            032: spo = 5'h19;
            033: spo = 5'h19;
            034: spo = 5'h19;
            035: spo = 5'h19;
            036: spo = 5'h19;
            037: spo = 5'h1a;
            038: spo = 5'h1a;
            039: spo = 5'h1a;
            040: spo = 5'h1a;
            041: spo = 5'h1a;
            042: spo = 5'h1a;
            043: spo = 5'h1b;
            044: spo = 5'h1b;
            045: spo = 5'h1b;
            046: spo = 5'h1b;
            047: spo = 5'h1b;
            048: spo = 5'h1a;
            049: spo = 5'h1a;
            050: spo = 5'h1a;
            051: spo = 5'h1a;
            052: spo = 5'h1a;
            053: spo = 5'h1b;
            054: spo = 5'h1b;
            055: spo = 5'h1b;
            056: spo = 5'h1b;
            057: spo = 5'h1b;
            058: spo = 5'h1b;
            059: spo = 5'h1c;
            060: spo = 5'h1c;
            061: spo = 5'h1c;
            062: spo = 5'h1c;
            063: spo = 5'h1c;
            064: spo = 5'h1b;
            065: spo = 5'h1b;
            066: spo = 5'h1b;
            067: spo = 5'h1b;
            068: spo = 5'h1b;
            069: spo = 5'h1c;
            070: spo = 5'h1c;
            071: spo = 5'h1c;
            072: spo = 5'h1c;
            073: spo = 5'h1c;
            074: spo = 5'h1c;
            075: spo = 5'h1d;
            076: spo = 5'h1d;
            077: spo = 5'h1d;
            078: spo = 5'h1d;
            079: spo = 5'h1d;
            080: spo = 5'h1c;
            081: spo = 5'h1c;
            082: spo = 5'h1c;
            083: spo = 5'h1c;
            084: spo = 5'h1c;
            085: spo = 5'h1d;
            086: spo = 5'h1d;
            087: spo = 5'h1d;
            088: spo = 5'h1d;
            089: spo = 5'h1d;
            090: spo = 5'h1d;
            091: spo = 5'h1e;
            092: spo = 5'h1e;
            093: spo = 5'h1e;
            094: spo = 5'h1e;
            095: spo = 5'h1e;
            096: spo = 5'h1d;
            097: spo = 5'h1d;
            098: spo = 5'h1d;
            099: spo = 5'h1d;
            100: spo = 5'h1d;
            101: spo = 5'h1e;
            102: spo = 5'h1e;
            103: spo = 5'h1e;
            104: spo = 5'h1e;
            105: spo = 5'h1e;
            106: spo = 5'h1e;
            107: spo = 5'h1f;
            108: spo = 5'h1f;
            109: spo = 5'h1f;
            110: spo = 5'h1f;
            111: spo = 5'h1f;
            112: spo = 5'h1e;
            113: spo = 5'h1e;
            114: spo = 5'h1e;
            115: spo = 5'h1e;
            116: spo = 5'h1e;
            117: spo = 5'h1e;
            118: spo = 5'h1f;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1f;
            123: spo = 5'h0;
            124: spo = 5'h0;
            125: spo = 5'h0;
            126: spo = 5'h0;
            127: spo = 5'h0;
            128: spo = 5'h1f;
            129: spo = 5'h1f;
            130: spo = 5'h1f;
            131: spo = 5'h1f;
            132: spo = 5'h1f;
            133: spo = 5'h1f;
            134: spo = 5'h0;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h0;
            139: spo = 5'h1;
            140: spo = 5'h1;
            141: spo = 5'h1;
            142: spo = 5'h1;
            143: spo = 5'h1;
            144: spo = 5'h0;
            145: spo = 5'h0;
            146: spo = 5'h0;
            147: spo = 5'h0;
            148: spo = 5'h0;
            149: spo = 5'h0;
            150: spo = 5'h1;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h1;
            155: spo = 5'h2;
            156: spo = 5'h2;
            157: spo = 5'h2;
            158: spo = 5'h2;
            159: spo = 5'h2;
            160: spo = 5'h1;
            161: spo = 5'h1;
            162: spo = 5'h1;
            163: spo = 5'h1;
            164: spo = 5'h1;
            165: spo = 5'h1;
            166: spo = 5'h2;
            167: spo = 5'h2;
            168: spo = 5'h2;
            169: spo = 5'h2;
            170: spo = 5'h2;
            171: spo = 5'h2;
            172: spo = 5'h3;
            173: spo = 5'h3;
            174: spo = 5'h3;
            175: spo = 5'h3;
            176: spo = 5'h2;
            177: spo = 5'h2;
            178: spo = 5'h2;
            179: spo = 5'h2;
            180: spo = 5'h2;
            181: spo = 5'h2;
            182: spo = 5'h3;
            183: spo = 5'h3;
            184: spo = 5'h3;
            185: spo = 5'h3;
            186: spo = 5'h3;
            187: spo = 5'h3;
            188: spo = 5'h4;
            189: spo = 5'h4;
            190: spo = 5'h4;
            191: spo = 5'h4;
            192: spo = 5'h3;
            193: spo = 5'h3;
            194: spo = 5'h3;
            195: spo = 5'h3;
            196: spo = 5'h3;
            197: spo = 5'h3;
            198: spo = 5'h4;
            199: spo = 5'h4;
            200: spo = 5'h4;
            201: spo = 5'h4;
            202: spo = 5'h4;
            203: spo = 5'h4;
            204: spo = 5'h5;
            205: spo = 5'h5;
            206: spo = 5'h5;
            207: spo = 5'h5;
            208: spo = 5'h4;
            209: spo = 5'h4;
            210: spo = 5'h4;
            211: spo = 5'h4;
            212: spo = 5'h4;
            213: spo = 5'h4;
            214: spo = 5'h5;
            215: spo = 5'h5;
            216: spo = 5'h5;
            217: spo = 5'h5;
            218: spo = 5'h5;
            219: spo = 5'h5;
            220: spo = 5'h6;
            221: spo = 5'h6;
            222: spo = 5'h6;
            223: spo = 5'h6;
            224: spo = 5'h5;
            225: spo = 5'h5;
            226: spo = 5'h5;
            227: spo = 5'h5;
            228: spo = 5'h5;
            229: spo = 5'h5;
            230: spo = 5'h6;
            231: spo = 5'h6;
            232: spo = 5'h6;
            233: spo = 5'h6;
            234: spo = 5'h6;
            235: spo = 5'h6;
            236: spo = 5'h7;
            237: spo = 5'h7;
            238: spo = 5'h7;
            239: spo = 5'h7;
            240: spo = 5'h6;
            241: spo = 5'h6;
            242: spo = 5'h6;
            243: spo = 5'h6;
            244: spo = 5'h6;
            245: spo = 5'h6;
            246: spo = 5'h7;
            247: spo = 5'h7;
            248: spo = 5'h7;
            249: spo = 5'h7;
            250: spo = 5'h7;
            251: spo = 5'h7;
            252: spo = 5'h8;
            253: spo = 5'h8;
            254: spo = 5'h8;
            255: spo = 5'h8;
            default: spo = 5'h0;
		endcase
	end
endmodule