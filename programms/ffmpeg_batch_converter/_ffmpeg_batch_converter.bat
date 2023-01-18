rem @echo off & setlocal

choice /c 1234567 /m "1: mp3->ogg; 2: mp4->ogg; 3: jpg->webp, 4: png->webp; 5: mp4->webm; 6: m4v->webm; 7: opus->ogg; STRG+C: Stops programm"

IF ERRORLEVEL 7 goto opus
IF ERRORLEVEL 6 goto m4v
IF ERRORLEVEL 5 goto webm
IF ERRORLEVEL 4 goto png
IF ERRORLEVEL 3 goto jpg
IF ERRORLEVEL 2 goto mp4
IF ERRORLEVEL 1 goto mp3


rem block for the mp3 converting options
:mp3
choice /c yn /m "Delete all mp3 after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.mp3) do (
	ffmpeg -i "%%~fi" -map 0:a -acodec libopus -vbr on "%%~dpni.ogg"
	)
GOTO end

:delete	
for /r %%i in (*.mp3) do (
	ffmpeg -i "%%~fi" -map 0:a -acodec libopus -vbr on "%%~dpni.ogg"
	if not errorlevel 1 if exist "%%~dpni.mp3" del /q "%%~fi"
	)
GOTO end


rem block for the mp4 converting options
:mp4
choice /c yn /m "Delete all mp4 after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.mp4) do (
	ffmpeg -i "%%~fi" -map 0:a -acodec libopus -vbr on "%%~dpni.ogg"
	)
GOTO end	

:delete
for /r %%i in (*.mp4) do (
	ffmpeg -i "%%~fi" -map 0:a -acodec libopus -vbr on "%%~dpni.ogg"
	if not errorlevel 1 if exist "%%~dpni.mp4" del /q "%%~fi"
	)
GOTO end	


rem block for the jpg converting options
:jpg
choice /c yn /m "Delete all jpg after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.jpg) do (
	ffmpeg -i "%%~fi" -c:v libwebp "%%~dpni.webp"
	)
GOTO end

:delete
for /r %%i in (*.jpg) do (
	ffmpeg -i "%%~fi" -c:v libwebp "%%~dpni.webp"
	if not errorlevel 1 if exist "%%~dpni.jpg" del /q "%%~fi"
	)
GOTO end


rem block for the png converting options
:png
choice /c yn /m "Delete all png after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.png) do (
	ffmpeg -i "%%~fi" -c:v libwebp "%%~dpni.webp"
	)
GOTO end

:delete
for /r %%i in (*.png) do (
	ffmpeg -i "%%~fi" -c:v libwebp "%%~dpni.webp"
	if not errorlevel 1 if exist "%%~dpni.png" del /q "%%~fi"
	)
GOTO end

rem block for the webm converting options
:webm
choice /c yn /m "Delete all mp4 after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.mp4) do (
	ffmpeg -i "%%~fi" -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus "%%~dpni.webm"
	)
GOTO end

:delete
for /r %%i in (*.mp4) do (
	ffmpeg -i "%%~fi" -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus "%%~dpni.webm"
	if not errorlevel 1 if exist "%%~dpni.mp4" del /q "%%~fi"
	)
GOTO end

rem block for the m4v converting options
:m4v
choice /c yn /m "Delete all m4v after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.m4v) do (
	ffmpeg -i "%%~fi" -c:v libvpx -b:v 1M -c:a libvorbis "%%~dpni.webm"
	)
GOTO end

:delete
for /r %%i in (*.m4v) do (
	ffmpeg -i "%%~fi" -c:v libvpx -b:v 1M -c:a libvorbis "%%~dpni.webm"
	if not errorlevel 1 if exist "%%~dpni.m4v" del /q "%%~fi"
	)
GOTO end

rem block for the opus converting options
:opus
choice /c yn /m "Delete all opus after converting?"
IF ERRORLEVEL 2 goto convert
IF ERRORLEVEL 1 goto delete

:convert
for /r %%i in (*.opus) do (
	ffmpeg -i "%%~fi" -map 0:a -acodec libopus -vbr on "%%~dpni.ogg"
	)
GOTO end

:delete	
for /r %%i in (*.opus) do (
	ffmpeg -i "%%~fi" -map 0:a -acodec libopus -vbr on "%%~dpni.ogg"
	if not errorlevel 1 if exist "%%~dpni.opus" del /q "%%~fi"
	)
GOTO end


:end
@PAUSE

