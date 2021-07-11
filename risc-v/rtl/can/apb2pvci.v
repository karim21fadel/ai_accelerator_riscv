`timescale 1 ns/1 ns
module apb2pvci(
	pvci_addr, pvci_wd, pvci_valid, pvci_rd, pvci_rdata,
        pclk, presetn, paddr, pwrite, pwdata ,
	psel, penable, prdata);
//parameter declaration
//**************************************
// input ports
//**************************************	
 //APB ports	
	input         pclk; 			 // clock
	input         presetn;			 // active low reset
        input [31:0]  paddr;
        input         pwrite;			 // write/read enable        
        input [31:0]  pwdata;			 // data bus
        input         psel;			 // slave select
	input         penable;			 // slave select		
  //PVCI ports
        input [7:0]   pvci_rdata;
//**************************************
// output ports
//**************************************
  //PVCI ports
        output [7:0]  pvci_addr;						
        output [7:0]  pvci_wd;
        output        pvci_valid;
        output        pvci_rd;		
 // APB ports
	output [31:0] prdata;			 // data output for wishbone slave
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
NVEm1Crjl1KG6hk961BEpdVILuPg7j8BmuYHNrxMun4H7j8dHGzPE4wJd9Voxpaw
agnK1CD6nFsue1Tw4TwIBvopNu8OUpXCG6Tq6xsbQjejRTdK7NVO9swstCN9YV7R
HuWIrmK2Q83I3yyQa6xMyFpnZHmOizBRFkB1t05CMNQ=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
MIENVSyFikSPhNSWl7Fo4ZJ6qRnn2v5OALpRKes1fHCdkbT+uH8wfU0k9b5kfWgs
UXnx2nGe/l5f5vna5qYtHMbEGdPTVG5fNy5G2njoDDJy1NUnuLlukSioGiFiqsU8
SpWh86874iQSdoWCWM+dTAAgRJ24OLhJbwsMGJBAb5s=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
