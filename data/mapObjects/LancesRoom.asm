LancesRoom_Object:
	db $3 ; border block

	db 3 ; warps
	warp 24, 16, 2, AGATHAS_ROOM
	warp 5, 0, 0, CHAMPIONS_ROOM
	warp 6, 0, 0, CHAMPIONS_ROOM

	db 0 ; signs

	db 9 ; objects
	object SPRITE_LANCE, 6, 1, STAY, DOWN, 1, OPP_LANCE, 1
	object SPRITE_OMANYTE, 8, 0, STAY, DOWN, 2
	object SPRITE_OMANYTE, 9, 0, STAY, DOWN, 2
	object SPRITE_OMANYTE, 10, 0, STAY, DOWN, 2
	object SPRITE_OMANYTE, 1, 0, STAY, DOWN, 2
	object SPRITE_OMANYTE, 2, 0, STAY, DOWN, 2
	object SPRITE_OMANYTE, 3, 0, STAY, DOWN, 2
	object SPRITE_OMANYTE, 3, 1, STAY, DOWN, 2
	object SPRITE_OMANYTE, 8, 1, STAY, DOWN, 2

	; warp-to
	warp_to 24, 16, LANCES_ROOM_WIDTH ; AGATHAS_ROOM
	warp_to 5, 0, LANCES_ROOM_WIDTH ; CHAMPIONS_ROOM
	warp_to 6, 0, LANCES_ROOM_WIDTH ; CHAMPIONS_ROOM
