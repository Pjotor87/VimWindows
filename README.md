#How to install
1. Install Vim for windows here: http://www.vim.org/download.php
2. Install Git

3. Either download the file "InstallPetersVimSettings.bat" and run it maually OR open cmd as administrator. Copy/Paste the following and hit enter:
```
if not exist "C:\TempScript_61f071e7-c02b-47d2-bc93-fd4a878c3aa5.bat" (
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Pjotor87/VimWindows/master/InstallPetersVimSettings.bat', 'C:\TempScript_61f071e7-c02b-47d2-bc93-fd4a878c3aa5.bat') }"
	call C:\TempScript_61f071e7-c02b-47d2-bc93-fd4a878c3aa5.bat
	del C:\TempScript_61f071e7-c02b-47d2-bc93-fd4a878c3aa5.bat
	)
```
This will try to download, run, and delete a copy of the "InstallPetersVimSettings.bat" from this repository in a temp file on your "C:\".

<br /><br /><br /><br /><br /><br />
_____

###Troubleshooting

#####The powershell comands are not allowed/not working
Download the file "InstallPetersVimSettings.bat" manually and run it as admnistrator

#####Vim is not installed at the default location
The install script will only work as is if you have installed Vim at the default location "C:\Program Files (x86)\Vim".
<br />
######If you have installed Vim in a different location
1. Download and perform a find and replace in the file "InstallPetersVimSettings.bat"
2. Run it manually as administrator.
