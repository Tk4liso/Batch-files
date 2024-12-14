@echo off


:1
set /p input= Enter Text For The File:
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "speech.vbs"
set text=%input%
echo speech.speak ("%text%") >> "speech.vbs"
start speech.vbs


goto 1