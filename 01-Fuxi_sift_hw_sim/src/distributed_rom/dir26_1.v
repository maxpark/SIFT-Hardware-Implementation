`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir26_1 
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

module dir26_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1a;
            001: spo = 5'h1a;
            002: spo = 5'h1b;
            003: spo = 5'h1c;
            004: spo = 5'h1d;
            005: spo = 5'h1e;
            006: spo = 5'h1f;
            007: spo = 5'h0;
            008: spo = 5'h1;
            009: spo = 5'h2;
            010: spo = 5'h3;
            011: spo = 5'h4;
            012: spo = 5'h5;
            013: spo = 5'h6;
            014: spo = 5'h7;
            015: spo = 5'h8;
            016: spo = 5'h19;
            017: spo = 5'h1a;
            018: spo = 5'h1b;
            019: spo = 5'h1c;
            020: spo = 5'h1d;
            021: spo = 5'h1e;
            022: spo = 5'h1f;
            023: spo = 5'h0;
            024: spo = 5'h1;
            025: spo = 5'h2;
            026: spo = 5'h3;
            027: spo = 5'h4;
            028: spo = 5'h5;
            029: spo = 5'h6;
            030: spo = 5'h7;
            031: spo = 5'h8;
            032: spo = 5'h19;
            033: spo = 5'h1a;
            034: spo = 5'h1b;
            035: spo = 5'h1c;
            036: spo = 5'h1d;
            037: spo = 5'h1e;
            038: spo = 5'h1f;
            039: spo = 5'h0;
            040: spo = 5'h1;
            041: spo = 5'h2;
            042: spo = 5'h3;
            043: spo = 5'h4;
            044: spo = 5'h5;
            045: spo = 5'h6;
            046: spo = 5'h7;
            047: spo = 5'h8;
            048: spo = 5'h19;
            049: spo = 5'h1a;
            050: spo = 5'h1b;
            051: spo = 5'h1c;
            052: spo = 5'h1d;
            053: spo = 5'h1e;
            054: spo = 5'h1f;
            055: spo = 5'h0;
            056: spo = 5'h1;
            057: spo = 5'h2;
            058: spo = 5'h3;
            059: spo = 5'h4;
            060: spo = 5'h5;
            061: spo = 5'h6;
            062: spo = 5'h7;
            063: spo = 5'h8;
            064: spo = 5'h19;
            065: spo = 5'h1a;
            066: spo = 5'h1b;
            067: spo = 5'h1c;
            068: spo = 5'h1d;
            069: spo = 5'h1e;
            070: spo = 5'h1f;
            071: spo = 5'h0;
            072: spo = 5'h1;
            073: spo = 5'h2;
            074: spo = 5'h3;
            075: spo = 5'h4;
            076: spo = 5'h5;
            077: spo = 5'h6;
            078: spo = 5'h7;
            079: spo = 5'h8;
            080: spo = 5'h19;
            081: spo = 5'h1a;
            082: spo = 5'h1b;
            083: spo = 5'h1c;
            084: spo = 5'h1d;
            085: spo = 5'h1e;
            086: spo = 5'h1f;
            087: spo = 5'h0;
            088: spo = 5'h1;
            089: spo = 5'h2;
            090: spo = 5'h2;
            091: spo = 5'h3;
            092: spo = 5'h4;
            093: spo = 5'h5;
            094: spo = 5'h6;
            095: spo = 5'h7;
            096: spo = 5'h18;
            097: spo = 5'h19;
            098: spo = 5'h1a;
            099: spo = 5'h1b;
            100: spo = 5'h1c;
            101: spo = 5'h1d;
            102: spo = 5'h1e;
            103: spo = 5'h1f;
            104: spo = 5'h0;
            105: spo = 5'h1;
            106: spo = 5'h2;
            107: spo = 5'h3;
            108: spo = 5'h4;
            109: spo = 5'h5;
            110: spo = 5'h6;
            111: spo = 5'h7;
            112: spo = 5'h18;
            113: spo = 5'h19;
            114: spo = 5'h1a;
            115: spo = 5'h1b;
            116: spo = 5'h1c;
            117: spo = 5'h1d;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h0;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h3;
            124: spo = 5'h4;
            125: spo = 5'h5;
            126: spo = 5'h6;
            127: spo = 5'h7;
            128: spo = 5'h18;
            129: spo = 5'h19;
            130: spo = 5'h1a;
            131: spo = 5'h1b;
            132: spo = 5'h1c;
            133: spo = 5'h1d;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h3;
            140: spo = 5'h4;
            141: spo = 5'h5;
            142: spo = 5'h6;
            143: spo = 5'h7;
            144: spo = 5'h18;
            145: spo = 5'h19;
            146: spo = 5'h1a;
            147: spo = 5'h1b;
            148: spo = 5'h1c;
            149: spo = 5'h1d;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h0;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h3;
            156: spo = 5'h4;
            157: spo = 5'h5;
            158: spo = 5'h6;
            159: spo = 5'h7;
            160: spo = 5'h18;
            161: spo = 5'h19;
            162: spo = 5'h1a;
            163: spo = 5'h1b;
            164: spo = 5'h1c;
            165: spo = 5'h1d;
            166: spo = 5'h1e;
            167: spo = 5'h1f;
            168: spo = 5'h0;
            169: spo = 5'h1;
            170: spo = 5'h2;
            171: spo = 5'h3;
            172: spo = 5'h4;
            173: spo = 5'h5;
            174: spo = 5'h6;
            175: spo = 5'h7;
            176: spo = 5'h18;
            177: spo = 5'h19;
            178: spo = 5'h1a;
            179: spo = 5'h1b;
            180: spo = 5'h1c;
            181: spo = 5'h1d;
            182: spo = 5'h1e;
            183: spo = 5'h1e;
            184: spo = 5'h1f;
            185: spo = 5'h0;
            186: spo = 5'h1;
            187: spo = 5'h2;
            188: spo = 5'h3;
            189: spo = 5'h4;
            190: spo = 5'h5;
            191: spo = 5'h6;
            192: spo = 5'h17;
            193: spo = 5'h18;
            194: spo = 5'h19;
            195: spo = 5'h1a;
            196: spo = 5'h1b;
            197: spo = 5'h1c;
            198: spo = 5'h1d;
            199: spo = 5'h1e;
            200: spo = 5'h1f;
            201: spo = 5'h0;
            202: spo = 5'h1;
            203: spo = 5'h2;
            204: spo = 5'h3;
            205: spo = 5'h4;
            206: spo = 5'h5;
            207: spo = 5'h6;
            208: spo = 5'h17;
            209: spo = 5'h18;
            210: spo = 5'h19;
            211: spo = 5'h1a;
            212: spo = 5'h1b;
            213: spo = 5'h1c;
            214: spo = 5'h1d;
            215: spo = 5'h1e;
            216: spo = 5'h1f;
            217: spo = 5'h0;
            218: spo = 5'h1;
            219: spo = 5'h2;
            220: spo = 5'h3;
            221: spo = 5'h4;
            222: spo = 5'h5;
            223: spo = 5'h6;
            224: spo = 5'h17;
            225: spo = 5'h18;
            226: spo = 5'h19;
            227: spo = 5'h1a;
            228: spo = 5'h1b;
            229: spo = 5'h1c;
            230: spo = 5'h1d;
            231: spo = 5'h1e;
            232: spo = 5'h1f;
            233: spo = 5'h0;
            234: spo = 5'h1;
            235: spo = 5'h2;
            236: spo = 5'h3;
            237: spo = 5'h4;
            238: spo = 5'h5;
            239: spo = 5'h6;
            240: spo = 5'h17;
            241: spo = 5'h18;
            242: spo = 5'h19;
            243: spo = 5'h1a;
            244: spo = 5'h1b;
            245: spo = 5'h1c;
            246: spo = 5'h1d;
            247: spo = 5'h1e;
            248: spo = 5'h1f;
            249: spo = 5'h0;
            250: spo = 5'h1;
            251: spo = 5'h2;
            252: spo = 5'h3;
            253: spo = 5'h4;
            254: spo = 5'h5;
            255: spo = 5'h6;
            default: spo = 5'h0;
		endcase
	end
endmodule