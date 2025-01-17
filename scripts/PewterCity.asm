PewterCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PewterCity_ScriptPointers
	ld a, [wPewterCityCurScript]
	jp CallFunctionInTable

PewterCity_ScriptPointers:
	dw PewterCityScript0
	dw PewterCityScript1
	dw PewterCityScript2
	dw PewterCityScript3
	dw PewterCityScript4
	dw PewterCityScript5
	dw PewterCityScript6
	dw PewterCityScript7
	dw PewterCityScript8

PewterCityScript0:
	xor a
	ld [wMuseum1FCurScript], a
	ResetEvent EVENT_BOUGHT_MUSEUM_TICKET
	call PewterCityScript_1925e
	ret

PewterCityScript_1925e:
	CheckEvent EVENT_BEAT_BROCK
	ret nz
	ld hl, CoordsData_19277
	call ArePlayerCoordsInArray
	ret nc
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

CoordsData_19277:
	db $11,$23
	db $11,$24
	db $12,$25
	db $13,$25
	db $ff

PewterCityScript1:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, $3
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_UP
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, ($3 << 4) | SPRITE_FACING_UP
	ld [hSpriteImageIndex], a
	call SetSpriteImageIndexAfterSettingFacingDirection
	call PlayDefaultMusic
	ld hl, wFlags_0xcd60
	set 4, [hl]
	ld a, $d
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $3c
	ld [$ffeb], a
	ld a, $30
	ld [$ffec], a
	ld a, $c
	ld [$ffed], a
	ld a, $11
	ld [$ffee], a
	ld a, $3
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, $3
	ld [H_SPRITEINDEX], a
	ld de, MovementData_PewterMuseumGuyExit
	call MoveSprite
	ld a, $2
	ld [wPewterCityCurScript], a
	ret

MovementData_PewterMuseumGuyExit:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

PewterCityScript2:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_MUSEUM_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $3
	ld [wPewterCityCurScript], a
	ret

PewterCityScript3:
	ld a, $3
	ld [wSpriteIndex], a
	call SetSpritePosition2
	ld a, HS_MUSEUM_GUY
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wPewterCityCurScript], a
	ret

PewterCityScript4:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, $5
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, ($1 << 5) | SPRITE_FACING_DOWN
	ld [hSpriteImageIndex], a
	call SetSpriteImageIndexAfterSettingFacingDirection
	call PlayDefaultMusic
	ld hl, wFlags_0xcd60
	set 4, [hl]
	ld a, $e
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $3c
	ld [$ffeb], a
	ld a, $40
	ld [$ffec], a
	ld a, $16
	ld [$ffed], a
	ld a, $10
	ld [$ffee], a
	ld a, $5
	ld [wSpriteIndex], a
	call SetSpritePosition1
	ld a, $5
	ld [H_SPRITEINDEX], a
	ld de, MovementData_PewterGymGuyExit
	call MoveSprite
	ld a, $5
	ld [wPewterCityCurScript], a
	ret

MovementData_PewterGymGuyExit:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

PewterCityScript5:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_GYM_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $6
	ld [wPewterCityCurScript], a
	ret

PewterCityScript6:
	ld a, $5
	ld [wSpriteIndex], a
	call SetSpritePosition2
	ld a, HS_GYM_GUY
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wPewterCityCurScript], a
	ret

PewterCityScript7:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_CELADON_MANSION_EEVEE_GIFT
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $3
	ld [wPewterCityCurScript], a
	ret

PewterCityScript8:
	ld a, $3
	ld [wSpriteIndex], a
	call SetSpritePosition2
	ld a, HS_CELADON_MANSION_EEVEE_GIFT
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wPewterCityCurScript], a
	ret



PewterCity_TextPointers:
	dw PewterCityText1
	dw PewterCityText2
	dw PewterCityText3
	dw PewterCityText4
	dw PewterCityText55
	dw PewterCityText6
	dw PewterCityText7
	dw MartSignText
	dw PokeCenterSignText
	dw PewterCityText10
	dw PewterCityText11
	dw PewterCityText12
	dw PewterCityText13
	dw PewterCityText14
	dw PewterCityText15
	dw VermilionHouse2Text1
	dw PewterGeorgeText
	dw PewterCityText18
	dw ViridianCityText17

PewterCityText1:
	TX_FAR _PewterCityText1
	db "@"

PewterCityText2:
	TX_FAR _PewterCityText2
	db "@"

PewterCityText3:
	TX_ASM
	ld hl, PewterCityText_193f1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_193c9
	ld hl, PewterCityText_193f6
	call PrintText
	jr .asm_193ee
.asm_193c9
	ld hl, PewterCityText_193fb
	call PrintText
	xor a
	ld [hJoyPressed], a
	ld [hJoyHeld], a
	ld [wNPCMovementScriptFunctionNum], a
	ld a, $2
	ld [wNPCMovementScriptPointerTableNum], a
	ld a, [H_LOADEDROMBANK]
	ld [wNPCMovementScriptBank], a
	ld a, $3
	ld [wSpriteIndex], a
	call GetSpritePosition2
	ld a, $1
	ld [wPewterCityCurScript], a
.asm_193ee
	jp TextScriptEnd

PewterCityText_193f1:
	TX_FAR _PewterCityText_193f1
	db "@"

PewterCityText_193f6:
	TX_FAR _PewterCityText_193f6
	db "@"

PewterCityText_193fb:
	TX_FAR _PewterCityText_193fb
	db "@"

PewterCityText13:
	TX_FAR _PewterCityText13
	db "@"

PewterCityText4:
	TX_ASM
	ld hl, PewterCityText_19427
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	jr nz, .asm_1941e
	ld hl, PewterCityText_1942c
	call PrintText
	jr .asm_19424
.asm_1941e
	ld hl, PewterCityText_19431
	call PrintText
.asm_19424
	jp TextScriptEnd

PewterCityText_19427:
	TX_FAR _PewterCityText_19427
	db "@"

PewterCityText_1942c:
	TX_FAR _PewterCityText_1942c
	db "@"

PewterCityText_19431:
	TX_FAR _PewterCityText_19431
	db "@"

PewterCityText55:
	TX_FAR _PewterCityText_19431d
	db "@"

PewterCityText5:
	TX_ASM
	ld hl, PewterCityText_1945d
	call PrintText
	xor a
	ld [hJoyHeld], a
	ld [wNPCMovementScriptFunctionNum], a
	ld a, $3
	ld [wNPCMovementScriptPointerTableNum], a
	ld a, [H_LOADEDROMBANK]
	ld [wNPCMovementScriptBank], a
	ld a, $5
	ld [wSpriteIndex], a
	call GetSpritePosition2
	ld a, $4
	ld [wPewterCityCurScript], a
	jp TextScriptEnd

PewterCityText_1945d:
	TX_FAR _PewterCityText_1945d
	db "@"

PewterCityText14:
	TX_FAR _PewterCityText14
	db "@"

PewterCityText6:
	TX_FAR _PewterCityText6
	db "@"

PewterCityText7:
	TX_FAR _PewterCityText7
	db "@"

PewterCityText10:
	TX_FAR _PewterCityText10
	db "@"

PewterCityText11:
	TX_FAR _PewterCityText11
	db "@"

PewterCityText12:
	TX_FAR _PewterCityText12
	db "@"
	
PewterCityText15:
	TX_ASM
	lb bc, WARTORTLE, 15
	call GivePokemon
	jr nc, .asm_24365
	ld a, HS_MUSEUM_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
.asm_24365
	jp TextScriptEnd

VermilionHouse2Text1:
	TX_ASM
	ld a, [wd728]
	bit 3, a
	jr nz, .asm_03ef5
	ld hl, VermilionHouse2Text_560b1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_eb1b7
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, wd728
	set 3, [hl]
	ld hl, VermilionHouse2Text_560b6
	jr .asm_5dd95
.BagFull
	ld hl, VermilionHouse2Text_560ca
	jr .asm_5dd95
.asm_eb1b7
	ld hl, VermilionHouse2Text_560c0
	jr .asm_5dd95
.asm_03ef5
	ld hl, VermilionHouse2Text_560c5
.asm_5dd95
	call PrintText
	jp TextScriptEnd

VermilionHouse2Text_560b1:
	TX_FAR _VermilionHouse2Text_560b1
	db "@"

VermilionHouse2Text_560b6:
	TX_FAR _VermilionHouse2Text_560b6
	TX_SFX_ITEM_1
	TX_FAR _VermilionHouse2Text_560bb
	db "@"

VermilionHouse2Text_560c0:
	TX_FAR _VermilionHouse2Text_560c0
	db "@"

VermilionHouse2Text_560c5:
	TX_FAR _VermilionHouse2Text_560c5
	db "@"

VermilionHouse2Text_560ca:
	TX_FAR _VermilionHouse2Text_560ca
	db "@"
	
PewterGeorgeText:
	TX_ASM
	ld hl, PewterGeorgeText_1d5b1
	call PrintText
	ld a, GROWLITHE
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

PewterGeorgeText_1d5b1:
	TX_FAR _PewterGeorgeText_1d5b1
	db "@"
	
PewterCityText18:
	TX_FAR _PewterCityText18
	db "@"
	
ViridianCityText17:
	TX_ASM
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .asm_627d9
	ld hl, PewterCityText5
	jr .asm_0b11d
.asm_627d9
	ld hl, BeatGText_75ac7
.asm_0b11d
	call PrintText
	jp TextScriptEnd

BeatGText_75ac7:
	TX_FAR _BeatGText_75ac7
	db "@"