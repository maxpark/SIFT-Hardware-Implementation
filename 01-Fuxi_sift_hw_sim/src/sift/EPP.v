`timescale 1ns / 1ps
                                                                                        

module EPP(EPP_Write0, EPP_Data, EPP_Interrupt, EPP_Wait, EPP_DataStrobe0, EPP_Reset0, EPP_AddressStrobe0, 
	write_b, raddr, dout, clk, div_clk, rst, eos_frame, data2ram,waddr,flag_read,read_grad,read_dir,
	read_kp, raddr_kp,kp_addr, raddr_main_dir, main_dir,read_main_dir,read_canny
	);



	input rst;
	input clk;
	input div_clk;



	//EPP interface signals
	input EPP_Write0;
	inout [7:0] EPP_Data;  //epp inout
	input EPP_DataStrobe0;
	input EPP_Reset0;
	input EPP_AddressStrobe0;
	output EPP_Interrupt;
	output EPP_Wait;
	

  
//	input data_clk;
//	input y_start;
//	output reg driving_begin;
	input eos_frame;

//       	output reg led;

	// regs for initialize ram
	output reg [7:0] data2ram;
	output reg [22:0] waddr;
//	output reg wram_complete;
	output reg write_b ;//�͵�ƽʱΪд,��ʼ��SRAM,�ߵ�ƽʱΪ��
	output reg read_grad; //�߶�RAM
	output reg read_dir; //�߶�RAM
	output reg read_kp;
	output reg flag_read;
	output reg read_main_dir;
//	output reg [19:0] waddr;	
	output reg [22:0] raddr;
	output reg [22:0] raddr_kp;
	output reg [9:0] raddr_main_dir;
	output reg read_canny;
	
	input [7:0] dout;	 //sram���	
	input [23:0] kp_addr; 
	input [7:0] main_dir;
	
/******************** module regs define ***********************************/

	reg read_L8;
//	reg read_M8;
	reg read_H8;
	
	wire [7:0] tmp1;
	wire [7:0] sent_kp;
	
	assign tmp1=read_L8?kp_addr[7:0]:kp_addr[15:8];
	assign sent_kp=read_H8?kp_addr[23:16]:tmp1;

	//regs related to EPP  out
	reg EPP_Interrupt,EPP_Wait;
	reg EPP_Write,EPP_DataStrobe,EPP_AddressStrobe,EPP_Reset;
	reg [7:0] epp_dataout;

	//�м�Ĵ���

	reg [2:0] epp_state;
	reg [2:0] cmd_state;
	reg needread;
	
   reg [2:0] counter_eos;
	
	parameter DLY_EOS=3'b001;//3'b011;

/**********************  module constant define  *******************************/
	//parameters EPP state
	parameter EPP_IDLE=3'b000,EPP_WAIT_ADDRREAD=3'b001,EPP_WAIT_ADDRWRITE=3'b010,
		EPP_WAIT_DATAREAD=3'b011,EPP_WAIT_DATAWRITE=3'b100;

	parameter CMD_IDLE=3'b000,CMD_WAIT_EOS_FRAME=3'b001,CMD_PC_READ=3'b010,EOS_WAIT=3'b011;

	parameter  PIC_LENGTH = 512;
	parameter  [22:0] TOTAL_PIXEL = 512 * 512-1;

//Ӧ����eppģ��������sram�Ķ�д��

always @ (posedge clk or negedge rst)
begin
	if(!rst)
	begin
		write_b<=0;
		cmd_state<=CMD_IDLE;
		EPP_Interrupt<=0;
//		waddr <= 0;
//		led<=0;
      counter_eos<=DLY_EOS;
//		driving_begin<=0;
	end
	else
		case(cmd_state)
			CMD_IDLE:
			begin
//				waddr<=0;
				write_b<=0;   //ѡ��д�ź�
				counter_eos<=DLY_EOS;
				cmd_state<=CMD_IDLE;
				EPP_Interrupt<=0;
				if(!needread) //PC����Ҫ��������źţ�д��SRAM
				begin
//					led<=0;
					write_b<=0; //ѡ��SRAMд�ź�

						cmd_state<=CMD_WAIT_EOS_FRAME;

				end
				else
				begin
//					led<=1;
//					driving_begin<=0;	//Ҳ�����ʱ������д��һ��Ҫ��д�꣡
					write_b<=1; //��ʼ���ź�	  !!!!!
					EPP_Interrupt<=1; //��PC�ɶ��ź�	 !!!!!!!
					cmd_state<=CMD_PC_READ;
				end
			end
		
			CMD_WAIT_EOS_FRAME: //�ȴ�
			begin

				write_b<=0; //ѡ��SRAMд�ź�


        	   if(eos_frame) //һ֡д��SRAM
				begin
//					start_frame<=1;
//					write_b<=1;       //������ͼ��дsram
                                       
					         cmd_state<=EOS_WAIT; //CMD_WAIT_EOS_CAL;
						
				end			
			end
         EOS_WAIT:
			begin
            if(counter_eos[2])               //�ӳ����ɸ�ʱ�ӣ�Ϊf-module�ܼ�⵽��һ֡�����ź�������
				begin
				    cmd_state<=CMD_IDLE; //CMD_WAIT_EOS_CAL;
					 counter_eos<=DLY_EOS;
				end					
				else
			      		 counter_eos<=counter_eos-1;
			 end
			CMD_PC_READ:
			begin
				write_b<=1;
				cmd_state<=CMD_PC_READ;
				if(!needread)  //PC����˶��ź�
				begin
					write_b<=0;
					EPP_Interrupt<=0;			 //PC���ɶ�!!!!!!!
					cmd_state<=CMD_IDLE;
				end
			end
			default:
				cmd_state<=CMD_IDLE;
		endcase		
end

/*********************  module internal logic  *********************************/

//��������������źţ���Ҫͬ��������������
//reg [7:0] dout0;

//always @ (posedge div_clk)
//begin
//	if (!rst)
//		dout0 <= 0;
//	else
//		dout0 <= dout;
//end

always @ (posedge div_clk)
begin
	if (!rst)
		EPP_Reset<=0;
	else
		EPP_Reset<=EPP_Reset0;
end

always @ (posedge div_clk)
begin
	if(!rst)
		EPP_Write<=1;
	else
		EPP_Write<=EPP_Write0;
end

always @ (posedge div_clk)
begin
	if(!rst)
		EPP_DataStrobe<=1;
	else
		EPP_DataStrobe<=EPP_DataStrobe0;
end

always @ (posedge div_clk)
begin
	if(!rst)
		EPP_AddressStrobe<=1;
	else
		EPP_AddressStrobe<=EPP_AddressStrobe0;
end


//EPP state machine
//reg epp_clock;
//always @ (posedge div_clk)
//begin
//	if(!rst)
//		epp_clock<=0;
//	else
//		epp_clock<=~epp_clock;
//end

//always@(posedge clk or negedge rst)
//begin
//	if(!rst)
//	begin
//		
//	end
//	else
//	begin
//		if(!needread)
//			raddr<=0;
//		
//	end
//end

always @ (posedge div_clk or negedge rst)
begin
	if(!rst)
	begin
		epp_state <= EPP_IDLE;
		EPP_Wait <= 0;
		epp_dataout <= 0;
		needread <= 0;//Ӧ�ø�Ϊ0��Ϊ���ԲŸĳ�1�ģ�
		raddr <= 0;
		raddr_kp <=0;
		raddr_main_dir<=0;
	//	rst_cnt<=0;
		waddr<=0;
		data2ram<=0;
//		wram_complete<=0;
		flag_read<=0;
		read_grad<=0;
		read_dir<=0;
		read_kp<=0;
		read_L8<=0;
		read_H8<=0;
		read_main_dir<=0;
		read_canny<=0;
	end
	else
	begin
		if(!needread)
			raddr<=0;
		if(!flag_read)
			waddr<=0;
		
		case(epp_state)
			EPP_IDLE:
			begin
				EPP_Wait<=0;
				if(!EPP_AddressStrobe)
				begin
					if(EPP_Write)     //�ж϶�/д
					begin//EPP address read
					/*	case(rst_cnt)
							0:epp_dataout<={4'b0000,x_org[19:16]};
							1:epp_dataout<=x_org[15:8];
							2:epp_dataout<=x_org[7:0];
							3:epp_dataout<={4'b0000,y_org[19:16]};
							4:epp_dataout<=y_org[15:8];
							5:epp_dataout<=y_org[7:0];
							default:epp_dataout<=0;
						endcase

						if(rst_cnt==5)
							rst_cnt<=0;
						else
							rst_cnt<=rst_cnt+1;
                                        */
						EPP_Wait<=1;
						epp_state<=EPP_WAIT_ADDRREAD;
					end
					else
					begin//EPP address write_b    cmd come from EPP address write_b
//						needread<=1;		//Ϊ���Ե���
				//***********  ����Ҫ��ȡͼ������ �� ��˴�Ӧ���޸� ******************//
				   	needread<=EPP_Data[0];  //��0λ��ʾҪ�������ȡ���Ҫȡ��
						flag_read<=(!EPP_Data[0])&EPP_Data[1]; //��ʼдRAM 0λ�ͣ�1λ��
						read_grad<=(EPP_Data==5);//[2]; //��ȡ�ݶ�ֵ
						read_dir<=(EPP_Data==9);//[3];	//��ȡ����ֵ
						read_kp<=EPP_Data[4];   //��ȡ������
						read_L8<=(EPP_Data==21);//[5];	//����8λ��ַ
						read_H8<=(EPP_Data==25);//[6];	//����8λ��ַ
						read_main_dir<=(EPP_Data==13);//[7]; //��ȡ������
						read_canny<=(EPP_Data==33);
						EPP_Wait<=1;
						epp_state<=EPP_WAIT_ADDRWRITE;
					end
				end
				else if(!EPP_DataStrobe)
				begin
					if(EPP_Write)
					begin//EPP data read
					
					//����߼������⣬ע�⣡����
					//epp_dataout ������if���渳ֵ������Ӱ�죬ʵ������ʾ����һ��if��������
					
//						if(read_kp)
//							epp_dataout<=sent_kp;//��sram�ж��������������epp�˿�
//						else
//							epp_dataout<=dout;//��sram�ж��������������epp�˿�
//							
//						if(read_main_dir)
//							epp_dataout<=main_dir;//��sram�ж��������������epp�˿�
//						else
//							epp_dataout<=dout;//��sram�ж��������������epp�˿�

						case({read_kp,read_main_dir})
							2'b00:epp_dataout<=dout;
							2'b01:epp_dataout<=main_dir;
							2'b10:epp_dataout<=sent_kp;
							default:epp_dataout<=dout;
						endcase
						
						EPP_Wait<=1;
						epp_state<=EPP_WAIT_DATAREAD;
					end
					else
					begin//EPP data write_b
					//************  ��ȡ���� ****************//
					//	din<=EPP_Data;	//��epp�˿ڶ��������������sram
						data2ram<=EPP_Data;
						EPP_Wait<=1;
						epp_state<=EPP_WAIT_DATAWRITE;
						if(flag_read)
						begin
						if(waddr< TOTAL_PIXEL)
							waddr<=waddr+1;
						else
							waddr<=0;
						end
					end
				end
			end
			EPP_WAIT_ADDRREAD:
			begin
				if(EPP_AddressStrobe)
				begin
					EPP_Wait<=0;
					epp_state<=EPP_IDLE;
				end
			end
			EPP_WAIT_ADDRWRITE:
			begin
				if(EPP_AddressStrobe)
				begin
					EPP_Wait<=0;
					epp_state<=EPP_IDLE;
				end
			end
			EPP_WAIT_DATAREAD:
			begin
				if(EPP_DataStrobe)
				begin
					EPP_Wait<=0;
					epp_state<=EPP_IDLE;
					if(needread)
					begin
						if(raddr<TOTAL_PIXEL)
							raddr<=raddr+1;
						else
							raddr<=0;
					end
					
					if(needread && read_kp)
					begin
						if(raddr_kp<1023)
							raddr_kp<=raddr_kp+1;
						else
							raddr_kp<=0;
					end
//					else
//						raddr<=0;
					if(needread && read_main_dir)
					begin
						if(raddr_main_dir<1023)
							raddr_main_dir<=raddr_main_dir+1;
						else
							raddr_main_dir<=0;
					end
					
				end
			end
			EPP_WAIT_DATAWRITE:
			begin
				if(EPP_DataStrobe)
				begin
					EPP_Wait<=0;
					epp_state<=EPP_IDLE;
				//	waddr<=waddr+1;
				end
			end
			default: epp_state<=EPP_IDLE;
		endcase
	end
end

  assign EPP_Data=((epp_state==EPP_WAIT_DATAREAD)||(epp_state==EPP_WAIT_ADDRREAD))?epp_dataout:8'bz; //FPGA����ʱΪ����


endmodule
