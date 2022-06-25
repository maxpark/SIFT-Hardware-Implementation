`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir9_2 
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

module dir9_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h18;
            001: spo = 5'h18;
            002: spo = 5'h18;
            003: spo = 5'h18;
            004: spo = 5'h18;
            005: spo = 5'h18;
            006: spo = 5'h18;
            007: spo = 5'h18;
            008: spo = 5'h18;
            009: spo = 5'h18;
            010: spo = 5'h18;
            011: spo = 5'h18;
            012: spo = 5'h18;
            013: spo = 5'h18;
            014: spo = 5'h18;
            015: spo = 5'h18;
            016: spo = 5'h19;
            017: spo = 5'h19;
            018: spo = 5'h19;
            019: spo = 5'h19;
            020: spo = 5'h19;
            021: spo = 5'h19;
            022: spo = 5'h19;
            023: spo = 5'h19;
            024: spo = 5'h19;
            025: spo = 5'h19;
            026: spo = 5'h19;
            027: spo = 5'h19;
            028: spo = 5'h19;
            029: spo = 5'h19;
            030: spo = 5'h19;
            031: spo = 5'h19;
            032: spo = 5'h1a;
            033: spo = 5'h1a;
            034: spo = 5'h1a;
            035: spo = 5'h1a;
            036: spo = 5'h1a;
            037: spo = 5'h1a;
            038: spo = 5'h1a;
            039: spo = 5'h1a;
            040: spo = 5'h1a;
            041: spo = 5'h1a;
            042: spo = 5'h1a;
            043: spo = 5'h1a;
            044: spo = 5'h1a;
            045: spo = 5'h1a;
            046: spo = 5'h1a;
            047: spo = 5'h1a;
            048: spo = 5'h1b;
            049: spo = 5'h1b;
            050: spo = 5'h1b;
            051: spo = 5'h1b;
            052: spo = 5'h1b;
            053: spo = 5'h1b;
            054: spo = 5'h1b;
            055: spo = 5'h1b;
            056: spo = 5'h1b;
            057: spo = 5'h1b;
            058: spo = 5'h1b;
            059: spo = 5'h1b;
            060: spo = 5'h1b;
            061: spo = 5'h1b;
            062: spo = 5'h1b;
            063: spo = 5'h1b;
            064: spo = 5'h1c;
            065: spo = 5'h1c;
            066: spo = 5'h1c;
            067: spo = 5'h1c;
            068: spo = 5'h1c;
            069: spo = 5'h1c;
            070: spo = 5'h1c;
            071: spo = 5'h1c;
            072: spo = 5'h1c;
            073: spo = 5'h1c;
            074: spo = 5'h1c;
            075: spo = 5'h1c;
            076: spo = 5'h1c;
            077: spo = 5'h1c;
            078: spo = 5'h1c;
            079: spo = 5'h1c;
            080: spo = 5'h1d;
            081: spo = 5'h1d;
            082: spo = 5'h1d;
            083: spo = 5'h1d;
            084: spo = 5'h1d;
            085: spo = 5'h1d;
            086: spo = 5'h1d;
            087: spo = 5'h1d;
            088: spo = 5'h1d;
            089: spo = 5'h1d;
            090: spo = 5'h1d;
            091: spo = 5'h1d;
            092: spo = 5'h1d;
            093: spo = 5'h1d;
            094: spo = 5'h1d;
            095: spo = 5'h1d;
            096: spo = 5'h1e;
            097: spo = 5'h1e;
            098: spo = 5'h1e;
            099: spo = 5'h1e;
            100: spo = 5'h1e;
            101: spo = 5'h1e;
            102: spo = 5'h1e;
            103: spo = 5'h1e;
            104: spo = 5'h1e;
            105: spo = 5'h1e;
            106: spo = 5'h1e;
            107: spo = 5'h1e;
            108: spo = 5'h1e;
            109: spo = 5'h1e;
            110: spo = 5'h1e;
            111: spo = 5'h1e;
            112: spo = 5'h1f;
            113: spo = 5'h1f;
            114: spo = 5'h1f;
            115: spo = 5'h1f;
            116: spo = 5'h1f;
            117: spo = 5'h1f;
            118: spo = 5'h1f;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h1f;
            122: spo = 5'h1f;
            123: spo = 5'h1f;
            124: spo = 5'h1f;
            125: spo = 5'h1f;
            126: spo = 5'h1f;
            127: spo = 5'h1f;
            128: spo = 5'h0;
            129: spo = 5'h0;
            130: spo = 5'h0;
            131: spo = 5'h0;
            132: spo = 5'h0;
            133: spo = 5'h0;
            134: spo = 5'h0;
            135: spo = 5'h0;
            136: spo = 5'h0;
            137: spo = 5'h0;
            138: spo = 5'h0;
            139: spo = 5'h0;
            140: spo = 5'h0;
            141: spo = 5'h0;
            142: spo = 5'h0;
            143: spo = 5'h0;
            144: spo = 5'h1;
            145: spo = 5'h1;
            146: spo = 5'h1;
            147: spo = 5'h1;
            148: spo = 5'h1;
            149: spo = 5'h1;
            150: spo = 5'h1;
            151: spo = 5'h1;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h1;
            155: spo = 5'h1;
            156: spo = 5'h1;
            157: spo = 5'h1;
            158: spo = 5'h1;
            159: spo = 5'h1;
            160: spo = 5'h2;
            161: spo = 5'h2;
            162: spo = 5'h2;
            163: spo = 5'h2;
            164: spo = 5'h2;
            165: spo = 5'h2;
            166: spo = 5'h2;
            167: spo = 5'h2;
            168: spo = 5'h2;
            169: spo = 5'h2;
            170: spo = 5'h2;
            171: spo = 5'h2;
            172: spo = 5'h2;
            173: spo = 5'h2;
            174: spo = 5'h2;
            175: spo = 5'h2;
            176: spo = 5'h3;
            177: spo = 5'h3;
            178: spo = 5'h3;
            179: spo = 5'h3;
            180: spo = 5'h3;
            181: spo = 5'h3;
            182: spo = 5'h3;
            183: spo = 5'h3;
            184: spo = 5'h3;
            185: spo = 5'h3;
            186: spo = 5'h3;
            187: spo = 5'h3;
            188: spo = 5'h3;
            189: spo = 5'h3;
            190: spo = 5'h3;
            191: spo = 5'h3;
            192: spo = 5'h4;
            193: spo = 5'h4;
            194: spo = 5'h4;
            195: spo = 5'h4;
            196: spo = 5'h4;
            197: spo = 5'h4;
            198: spo = 5'h4;
            199: spo = 5'h4;
            200: spo = 5'h4;
            201: spo = 5'h4;
            202: spo = 5'h4;
            203: spo = 5'h4;
            204: spo = 5'h4;
            205: spo = 5'h4;
            206: spo = 5'h4;
            207: spo = 5'h4;
            208: spo = 5'h5;
            209: spo = 5'h5;
            210: spo = 5'h5;
            211: spo = 5'h5;
            212: spo = 5'h5;
            213: spo = 5'h5;
            214: spo = 5'h5;
            215: spo = 5'h5;
            216: spo = 5'h5;
            217: spo = 5'h5;
            218: spo = 5'h5;
            219: spo = 5'h5;
            220: spo = 5'h5;
            221: spo = 5'h5;
            222: spo = 5'h5;
            223: spo = 5'h5;
            224: spo = 5'h6;
            225: spo = 5'h6;
            226: spo = 5'h6;
            227: spo = 5'h6;
            228: spo = 5'h6;
            229: spo = 5'h6;
            230: spo = 5'h6;
            231: spo = 5'h6;
            232: spo = 5'h6;
            233: spo = 5'h6;
            234: spo = 5'h6;
            235: spo = 5'h6;
            236: spo = 5'h6;
            237: spo = 5'h6;
            238: spo = 5'h6;
            239: spo = 5'h6;
            240: spo = 5'h7;
            241: spo = 5'h7;
            242: spo = 5'h7;
            243: spo = 5'h7;
            244: spo = 5'h7;
            245: spo = 5'h7;
            246: spo = 5'h7;
            247: spo = 5'h7;
            248: spo = 5'h7;
            249: spo = 5'h7;
            250: spo = 5'h7;
            251: spo = 5'h7;
            252: spo = 5'h7;
            253: spo = 5'h7;
            254: spo = 5'h7;
            255: spo = 5'h7;
            default: spo = 5'h0;
		endcase
	end
endmodule