# FFMPEG Batch-converter
The .bat file in this directory can be used to convert multiple files in a folder at once. The resulting fileformats are saving diskspace.

## Why?
Disk space on webservers is expensive. My usecase is the usage of [FoundryVTT](https://foundryvtt.com/) for playing tabletop games. I need visual maps and sounds for immersion.
png, jpg, mp3 as well as mp4 are quite large and can be replaced by other fileformats more suitable with virtually no loss.
The fileformats I am using are .ogg (music) and .webp (maps, pictures)  
#### Why .mp4 -> ogg?
When downloading music for my games the files often come as .mp4, therefore I included that option.

## Instruction
1. Download and install FFMPEG and set the Pathvariable: https://windowsloop.com/install-ffmpeg-windows-10/  
(1.5. Create a test folder for initial testing causes)
2. Download convert-choice.bat and place it in the folder containing the data you want to convert 

DO NOT EXECUTE IN A FOLDER WITH DATA YOU DON´T WANT TO CONVERT/DELETE!

3. Execute the .bat

### Example
![overview](https://github.com/Mastecker/ffmpeg-batch-converter/blob/main/pictures/overview.png)
![usage](https://github.com/Mastecker/ffmpeg-batch-converter/blob/main/pictures/usage.png)


## Notes
Eventual fileloss is not my fault. Use the converter only at your own risk.  
Do not use the .bat on files that are already integrated in your server. The links in your compendiums etc. will break!  
JUST PRIOR TO UPLOADING!
