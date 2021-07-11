module mcan2_apb_pvci_wrapper(
	pclk , presetn,  
        paddr, pwrite, pwdata, psel,  penable,
	prdata, pready, pslverr, rx0, tx0, tx1 
	);
//APB ports	
	input         pclk; 			 // clock
	input         presetn;			 // active low reset
    input [31:0]  paddr;
    input         pwrite;			 // write/read enable        
    input [31:0]  pwdata;			 // data bus
    input         psel;			     // slave select
	input         penable;			 // slave select		
    input         rx0;
//**************************************
// output ports
//**************************************
 // APB ports
	output [31:0] prdata;			 // data output for wishbone slave
    output        pready;
    output        pslverr;
    output        tx0;
    output        tx1;
// Parameters
    parameter     BASE_ADDRESS  = 32'h1A108000;
wire [7:0] pvci_addr;
wire [7:0] pvci_wdata;
wire       pvci_valid;
wire       pvci_read;
wire [7:0] pvci_rdata;
wire       nxtal1_enable;
wire       xtal1_and_enable;
wire       xtal1_in_inverted;
wire       test;
wire       clkout;
wire       tx1;
wire       nint;
reg [31:0]  paddr_mapped; 
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
JqMwA+PatZeoBvTdfHg37uG6NNcnxZ2i634rZgNYnE1YOiB1pljZEUYjcTYZP9i4
f5mT//NqvUba4hMPxQ+ePE6fu8zRSmk7GILicg22FLWs1cr+irU8WMxaZ6CMitLg
n9CizxByauyTRluqAI4y5bFfYaMWHN0AnwG3zk4iWx0=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
Zukj3+DU/eyCuJIvRBJqUauP4O2ZPkNlSHDJ+rg2m/TAObkW9L5KTD3S2SOI/UsN
HufP2otNcAnWoLdgooG4V1VTXgcfCMd13Bp+fqjnxwJzq/HLPLv/oL0c1UwhhkNQ
MnpTZlyoOL2u4I6kJXVjbqaDCxMmwPUZTCJ2BIyYZiU=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
PZ4QeVTHOEAdvPIw3+2l9n5B35m3YWQmw3O7qvbyihFGZ6R6U+FkIumg9NpL+Pd9
yjR13qskVf2N3Lo/0TPBYA6CgkAeCQv/72mA9EMTJm35BxSWhTSqneu0UAAdtzwy
3HwYqTIg1iv0M3MmwAgCv7H77ax/JbEpKoOnrOgIpuroNzw0nF5zlDQ85hRS/973
XkPmM3k/lJgTjEFxQyRKANq9twyZp4Ga7g3VZDSqMmDzws/o9d25uqr81tgxDvTR
HCbrCZSOqXvceqkwUBAk0IOBni1niENStblGlnEoo/JUkIwNlt1aLhIHbHyL9tuj
mAtRlDMdFvWQaadl8GvnKg0aSbQMioPWYwdWE5rFi1ipd51EFju1UEhpVmEKO88M
uVFKHD6oIxLow6nKEwalMOW2x91n6GmDphTRieIl1bK0ihdn845PKysyaOhgEFx+
OQXtkvE9h0Ceb/N0HojmVPEAHxhn3+q16jJ51hkR8WjhRg+/h/YH1FhxyGz+yPGg
QFKzVQT47aOPrBQ7DxaZHg==
`pragma protect end_protected
mcan2_io U1 (.addr(pvci_addr), .wd(pvci_wdata), .valid(pvci_valid), .read(pvci_read), .rdata(pvci_rdata), .xtal1(pclk), .rx0(rx0),
        .xtal1_in(xtal1_and_enable),  .nxtal1_in(xtal1_in_inverted), .nxtal1_enable(nxtal1_enable), .test(test),
        .nrst(presetn), .clkout(clkout), .nint(nint), .tx0(tx0), .tx1(tx1));
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
FaKgq6Nj9p1SWv/FLfDAsh9MuGpbcM2rTnQQijWtiB8z+oG+/f3xYdUP/eY0DsNY
2SoIHTEZmFDdBLx5gIVO4Im/gWvHEc6sVqN5W8UUoKDKJsEPosfhRAq4t5vmOnaL
1I0iSDguqdZlcoFRVRUyYPygE7WsO0TsuTu6J5VD1L0=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
al/443I58VwMs9/4xAKAbBJbFAiNLdMJ6trKZziABa81+dqylqEqSI7LtzLJDL9q
L2/SDAsm1jHPheWiosaaYEfPKy19vHRWEHN8E/Ukv+gb6Vfgsw0Ds8exbPx2Y4Ah
/AxEHdTFS0gcsfeTbwfy6NJM6zKQ9J6S8lE3aahnNhI=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
apb2pvci
  can_bridge_i
  (
    .pvci_addr   (pvci_addr),
    .pvci_wd     (pvci_wdata),
    .pvci_valid  (pvci_valid),
    .pvci_rd     (pvci_read),
    .pvci_rdata  (pvci_rdata),
    .pclk       (pclk),
    .presetn    (presetn),
    .paddr      (paddr_mapped),
    .pwrite     (pwrite),
    .pwdata     (pwdata),
    .psel       (psel),
    .penable    (penable),
    .prdata     (prdata)
  );
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
m1vM4lL7szsmgmC/YltOkZz9q6vwcAKlZ92979Oe7QuugKTF5XBhJvolzZPzGpvb
0F7Ba8Q+Ox8Xka67ajxJQRuo9S4FruBnLX9eWstYh+WXvsuvlrbtSwYbTi08gVf8
OIOPlLaf+QAgnCg47VBooSkI90wbZONacDcdOVhqdJw=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
asUYeGRi8UGmsRVgTHNJUXkcZuJh6woSYAPI7jKaZUacTRV5xJo9PiYTjo2040oe
jtivGxFNC6dK5hHgz1+r87e5sMwxgLraIlBk9KUnERzszqG5y+YuA4Awk49cOEeK
KP0JrLbC6BuQeRicH+a6EA1Bpe4n0/cCGNyIQCup89A=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
j+kdmVuPdHfBGoRN+h3cBQ==
`pragma protect end_protected
