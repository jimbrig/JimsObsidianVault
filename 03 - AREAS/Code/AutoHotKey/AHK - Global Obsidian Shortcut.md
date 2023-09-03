```autohotkey
#NoTrayIcon

; Open Vault - CtrlAltShift+V
; ^!+v:: ;{ <-- Obsidian: Open Vault

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; CtrlAltShift + N 		- Obsidian: fresh new note
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!+n:: ;{ <-- Obsidian: Fresh New Note
	if WinExist("Obsidian")
	{
		WinActivate Obsidian
		Sleep, 200
		WinMaximize Obsidian
	}
	else
	{
		Run, C:\Users\jimbr\AppData\Local\Obsidian\Obsidian.exe
		; Run, obsidian://vault/Engineered-Knowledge
		Sleep, 1500
		WinMaximize md - Obsidian
	}
	; close any previous note
	SendInput ^w
	; txt size
	; SendInput ^0
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; ; make full screen
	SendInput {F11}

	; check if left sidebar is open
	; and close it
	; (depends on my current theme!)
	; CoordMode, Pixel
	; PixelGetColor, color, 93, 115
	; if (color = "0x000000") ; sidebar is closed
	; {
	; 	; nothing
	; }
	; else ; sidebar is open
	; {
	; 	SendInput ^k
	; }

	; open new note
	SendInput ^n

	; move cursor from name field into file itself
	Sleep, 400
	SendInput {Tab}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; CtrlAltShift + F 		- Obsidian: search all notes
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!+f:: ;{ <-- Obsidian: Search All Notes
	if WinExist("md - Obsidian")
	{
		WinActivate md - Obsidian
		Sleep, 200
		WinMaximize md - Obsidian
	}
	else
	{
		Run, C:\Users\jimbr\AppData\Local\Obsidian\Obsidian.exe
		Sleep, 1500
		WinMaximize md - Obsidian
	}
	SendInput ^w
	SendInput ^0
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	; SendInput ^{=}
	SendInput ^+f
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; CtrlAltShift + O 		- Obsidian: open note by name
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!+o:: ;{ <-- Obsidian: Open Note by Name
	if WinExist("md - Obsidian")
	{
		WinActivate md - Obsidian
		Sleep, 200
		WinMaximize md - Obsidian
	}
	else
	{
		Run, C:\Users\jimbr\AppData\Local\Obsidian\Obsidian.exe
		Sleep, 1500
		WinMaximize md - Obsidian
	}
	SendInput ^w
	SendInput ^0
	; SendInput {F11}

	CoordMode, Pixel
	PixelGetColor, color, 93, 115

	if (color = "0x000000") ; sidebar is closed
	{
		; nothing
	}
	else ; sidebar is open
	{
		SendInput ^k
	}

	SendInput ^o
return
```