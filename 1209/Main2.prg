Integer count
Integer j, p_2, ct, cta, ct2, cta2, zz
Boolean ch
Double TokenHeight3
Double BlockHeight3
Double TokenWidth3
Double BlockWidth3
Double thc, bhc, twc, bwc, twca, bwca

Function main2
Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1

count = 19
TokenHeight3 = 6.0
BlockHeight3 = 6.0
TokenWidth3 = 20.0
BlockWidth3 = 24.0

p_2 = 0
twc = 0
bwc = 0
bwca = 0.5
twca = 0.5
thc = 0
bhc = 0
ch = False
ct = 4
cta = 4
ct2 = 4
cta2 = 4
For j = count To 0 Step -1
    task3_put(p_2)
    If ch = False Then
    	If ct = 0 Then
    		bhc = bhc + 1
    		bwc = bwca
    		bwca = bwca + 0.5
    		cta = cta - 1
    		ct = cta
    	EndIf
    task3_block(bhc)
    bwc = bwc + 1
    ct = ct - 1
    EndIf
	If ch = True Then
	    If ct2 = 0 Then
	    	thc = thc + 1
	    	twc = twca
	    	twca = twca + 0.5
	    	cta2 = cta2 - 1
	    	ct2 = cta2
	    EndIf
    task3_token(thc)
    twc = twc + 1
    ch = ch - 1
    ct2 = ct2 - 1
    EndIf
   p_2 = p_2 + 1
   ch = Not ch
   zz = zz + 1
   'Print ch, bwc, twc'
Next

Fend
Function task3_put(put33 As Integer)
	Print "Picking Token from Infeed. Token ID = ", j
	Go Task3_start CP
	Print "put value=", put33
	Move Task3_start -Z(1 + (put33 * TokenHeight3)) CP
	Wait .5
	On 11
	Move Task3_start +Z(100 - (put33 * TokenHeight3))
Fend
Function task3_token(TH As Integer)
	Move Task3_move2 -Y(twc * TokenWidth3) +Z(10 + (TH * TokenHeight3))
	Move Task3_move2 -Y(twc * TokenWidth3) +Z(TH * TokenHeight3)
	Wait .5
	Off 11
	Move Task3_move2 -Y(twc * TokenWidth3) +Z(150 + (TH * TokenHeight3))
Fend
Function task3_block(BH As Integer)
	Move Task3_move -Y(bwc * BlockWidth3) +Z(10 + (BH * BlockHeight3))
	Move Task3_move -Y(bwc * BlockWidth3) +Z(BH * BlockHeight3)
	Print Task3_move -Y(bwc * BlockWidth3) +Z(BH * BlockHeight3)
	Wait .5
	Off 11
	Move Task3_move -Y(bwc * BlockWidth3) +Z(150 + (BH * BlockHeight3))

Fend

