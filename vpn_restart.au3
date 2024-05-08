#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global $X = 1920/2
Global $Y = 745
Local $file = FileOpen(@ScriptDir & "\config.txt")
If($file <> -1) Then
	Local $text = FileRead($file)
	Local $data = StringSplit($text, ' ')
	$X = $data[1]
	$Y = $data[2]
	FileClose($file)
EndIf
While True
	Sleep(1000)
	Local $success = False
	For $i = 1 To 4
		Local $ping = Ping("192.168.101.1", 2000)
		If $ping Then
			$success = True
			ExitLoop
		EndIf
	Next
	If Not $success Then
		If WinExists("FortiClient") Then
			WinActivate("FortiClient")
			MouseClick("left", $X, $Y, 1, 10)
		Else
			Run("C:\Program Files\Fortinet\FortiClient\FortiClient.exe")
			WinWaitActive("FortiClient")
			Sleep(1000)
			MouseClick("left", $X, $Y, 1, 10)
			Sleep(5000)
			If WinExists("Оповіщення системи безпеки") Then
				ControlClick("Оповіщення системи безпеки", "", 1)
			EndIf
		EndIf
		Sleep(5000)
		WinClose("FortiClient")
	EndIf
WEnd