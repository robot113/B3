Integer Tokens
Integer Blocks
Double TokenHeight
Double BlockHeight
Function main

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1

Tokens = 2
Blocks = 2
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

Go Retract_Safe

For TokenID = Tokens To 0 Step -1
	Pick_Infeed_Token()
	Alignment_Token()
	Place_Tray_Token()
Next TokenID

For BlockID = Blocks To 0 Step -1
	Pick_Infeed_Block()
	Alignment_Block()
	Place_Tray_Block()
Next BlockID

Go comeback

Fend
Integer Tokens2
Integer Blocks2
Integer i, p
Integer put2
Double TokenHeight2
Double BlockHeight2
Function MAIN3

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
	
    Pick_Infeed_Token()
    Put(p)
    p = p + 1
    Pick_Infeed_Block()
    Put(p)
    p = p + 1
Next


Go Retract_Safe

Fend

Function Put(put22 As Integer)
	Go PutPos +Z(10 + (put22 * TokenHeight2)) CP
	Move PutPos +Z(put22 * TokenHeight2)
	Off 8
	Wait .5
	Move PutPos +Z(10 + (put22 * TokenHeight2)) CP

	
Fend

Function Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go Infeed_Token +Z(50 + (Tokens * TokenHeight)) CP
	Move Infeed_Token +Z(Tokens * TokenHeight)
	On 8
	Wait .5
	Move Infeed_Token +X(-1) +Z(50 + (Tokens * TokenHeight)) CP
	'Tokens = Tokens - 1'
Fend

Function Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go Infeed_Block +Z(50 + (Blocks * BlockHeight)) CP
	Move Infeed_Block +Z(Blocks * BlockHeight)
	On 8
	Wait .5
	Move Infeed_Block +X(-1) +Y(1) +Z(50 + (Blocks * BlockHeight)) CP
	'Blocks = Blocks - 1'
Fend

Function Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", Tokens
	Go Align_Token +Z(20) CP
	Move Align_Token
	Off 8
	Move Align_Token +X(5)
	Wait .5
	Move Align_Token +X(5) +Z(5) CP
	Go Align_Token +Z(5) CP
	Move Align_Token
	On 8
	Wait .5
	Move Align_Token +Z(20) CP
Fend

Function Alignment_Block
	'Alignment Block
	Print "Aligning Block. Block ID = ", Blocks
	Go Align_Block +Z(20) CP
	Move Align_Block
	Off 8
	Wait .5
	Move Align_Block +X(12) +Y(-3)
	Wait .5
	Move Align_Block +X(12) +Y(-3) CP
	Move Align_Block +X(12) +Y(-3) +Z(5) CP
	Go Align_Block +Z(5) CP
	Move Align_Block
	On 8
	Wait .5
	Move Align_Block +Z(20) CP
Fend

Function Place_Tray_Token
	'Tray Token
	Print "Placing Token in Tray. Tray Position ID = ", Tokens
	Go Tray_Token +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(20) CP
	Move Tray_Token +X(-.05 * Tokens) +Y(-30. * Tokens)
	Off 8
	Wait .5
	Move Tray_Token +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(50) CP
	Tokens = Tokens - 1
Fend

Function Place_Tray_Block
	'Tray Block
	Print "Placing Block in Tray. Block Position ID = ", Blocks
	Go Tray_Block +X(-.01 * Blocks) +Y(-30. * Blocks) +Z(20) CP
	Move Tray_Block +X(-.01 * Blocks) +Y(-30. * Blocks)
	Off 8
	Wait .5
	Move Tray_Block +X(-.05 * Blocks) +Y(-30. * Blocks) +Z(50) CP
	Blocks = Blocks - 1
Fend


