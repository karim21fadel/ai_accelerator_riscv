module mcan2_ahb_pvci_wrapper(
	hclk , hresetn,  
    haddr, htrans, hwrite, hsize, hburst,
	hsel, hwdata, rx0, tx0, hrdata, hresp, hready
	);
input         hclk; 			 // clock
input         hresetn;			 // active low reset
input [31:0]  haddr;
input [1:0]   htrans;			 // type of transfer
input         hwrite;			 // write/read enable
input [2:0]   hsize;			 // data size
input [2:0]   hburst;			 // burst type
input         hsel;			     // slave select 
input [31:0]  hwdata;			 // data bus
input         rx0;		
output          tx0;
output [31:0]   hrdata;			 // data output for wishbone slave
output [1:0]    hresp;			 // response signal from slave
output          hready;			 // slave ready
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
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
Gwh0Tnyd9hG5jqXrWzaYsLEtz2gLnQoKjGs8IqD9MOwJOoppChfZ+mVEMM5Fofve
vqFzoarDGl2NUCR8efVCcz+J+KwarRDh6zh8ZsbBVdm8hX72ZtV5NeyFuqo/iXHE
/aO1wbT5+zu+rJ8NUcJE2j+LoEFGsaCeKyseVC8JlKg=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
X+uBr6kx48FYvv7qGL9o0VdOqs6ebZd27GwCZYnNMVRiP/ClodKCbMJ0Jg8bhqOJ
lpwK+daJruXj6pbTqn8VyKNDH5zA9ttvOALq52OKpKkF4MeYf2IV8FyM22qRf9Pi
MjaQf9UaVnmwgbLOGz90h5VEtZMT45lhBybHfUOFA6U=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
0r90KFSvrvzbKntpLrtdKjSgMM53M2DfJ6Hrk80dUaZweR/1q4JHTrzZ/YOqrRJn
KrLb67GQXx9Rp44STg6xOE9nyNt0YOTWTcpV/eTLSukLsmOrt7KKiYlsDPE8vLzg
pki7EyuXfIf6W6btWCUQ3j+KW1aNafMrAhSpGCXIVkS9fDoCWpTINLgMPOkOxhlm
8PCzbsZDwwdF+KO7w0PgTns+Lf5lZL5AIAjqWaQJ6hXOMgTm3YNUMspWw41ZC+oB
UzVezA8C2YNO+8PtqEmMhXLmWKc+f7VtIlxrxFwqvT7zvfVI+A7ERfjffrflAlZn
vAREca95ttA+L/ZUQPgBGoBR1hDrcH3Q317CXPrm5o3OOOmrFsw4j0Mu1yDAjy8v
Vu/P49FGf96n1pP9eJK9Ezx0DLt9Eg5aekbKa57QX2OE15YkfLM1GEb8TxETvHx0
pjcgKuT3Iot2ep0X3nSdNw==
`pragma protect end_protected
mcan2_io U1 (.addr(pvci_addr), .wd(pvci_wdata), .valid(pvci_valid), .read(pvci_read), .rdata(pvci_rdata), .xtal1(hclk), .rx0(rx0),
        .xtal1_in(xtal1_and_enable),  .nxtal1_in(xtal1_in_inverted), .nxtal1_enable(nxtal1_enable), .test(test),
        .nrst(hresetn), .clkout(clkout), .nint(nint), .tx0(tx0), .tx1(tx1));
ahb2pvci U2 (.pvci_addr(pvci_addr), .pvci_wd(pvci_wdata), .pvci_valid(pvci_valid), .pvci_rd(pvci_read), .pvci_rdata(pvci_rdata), .hclk(hclk), .hresetn(hresetn),
        .haddr(haddr),  .htrans(htrans), .hwrite(hwrite), .hsize(hsize),
        .hburst(hburst), .hsel(hsel), .hwdata(hwdata), .hrdata(hrdata), .hresp(hresp) , .hready(hready));
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
jVK0dDYWWEbAP/KUxwccu6F9bt2+BgBKVDb83BidKtAlixEOzI5TRldyHEcbNTGU
aULELhwUhJoZxFIOgemYcnXVbICM09L5h3uyYolaIx/R6VCNqxHaJt7s4FSBCmdp
mpuE4nBTRNTfpwjtmpBCnsuXF+gA+Pv/MmeUSluMd2k=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
lNT6JlCrVSJuwCSZOj1RN+q86+tjUsCqs/xZMiT2aY+ZUBhDNi5Z+WIuk3/NNI4h
nApVDl2rEqyisA62dkmMB6se9fK/TsZmbimjXJj92Kkfcsf9ugSj/8Db8LYrk5F8
RfwaVcTMhjjbtqhV5V1NQQfO9eJ40bk7tiKZKZYU/rs=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
Hvs0SC8MZoMKEC37MS0CHQ==
`pragma protect end_protected
