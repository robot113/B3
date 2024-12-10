Integer Tokens
Integer Blocks
Double TokenHeight
Double BlockHeight
Integer Tokens2
Integer Blocks2
Integer i, p
Integer put2
Double TokenHeight2
Double BlockHeight2
Function main1

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1
Tokens = 9
Blocks = 9
TokenHeight = 6.0
BlockHeight = 6.0
put2 = 9
TokenHeight2 = 6.0
BlockHeight2 = 6.0

Go Retract_Safe

p = 0
For i = 0 To put2 Step 1
	
    Pick_Infeed_Token_1()
    Put(p)
    p = p + 1
    Pick_Infeed_Block_1()
    Put(p)
    p = p + 1
Next


Go Retract_Safe

Fend
Function Pick_Infeed_Token_1
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go Infeed_Token +Z(50 + (Tokens * TokenHeight)) CP
	Move Infeed_Token +Z(Tokens * TokenHeight)
	On 8
	Wait .5
	Move Infeed_Token +X(-1) +Z(50 + (Tokens * TokenHeight)) CP
	'執行pick & place需註解掉
	Tokens = Tokens - 1
Fend
Function Pick_Infeed_Block_1
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go Infeed_Block +Z(50 + (Blocks * BlockHeight)) CP
	Move Infeed_Block +Z(Blocks * BlockHeight)
	On 8
	Wait .5
	Move Infeed_Block +X(-1) +Y(1) +Z(50 + (Blocks * BlockHeight)) CP
	'執行pick & place需註解掉
	Blocks = Blocks - 1
Fend
Function Put(put22 As Integer)
	Go PutPos +Z(20 + (put22 * TokenHeight2)) CP
	Move PutPos +Z(put22 * TokenHeight2)
	Off 8
	Wait .5
	Move PutPos +Z(20 + (put22 * TokenHeight2)) CP
Fend

