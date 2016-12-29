@echo off

ECHO A quick reminder. Did you run this script as administrator?
ECHO If not, exit and run the script again as administrator.
ECHO Otherwise press any key to begin installing.
PAUSE

ECHO Creating autoload and bundle directories
if not exist "C:\Program Files (x86)\Vim\vimfiles\autoload" mkdir "C:\Program Files (x86)\Vim\vimfiles\autoload"
if not exist "C:\Program Files (x86)\Vim\vimfiles\bundle" mkdir "C:\Program Files (x86)\Vim\vimfiles\bundle"

ECHO Trying to download pathogen with Powershell
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://tpo.pe/pathogen.vim', 'C:\Program Files (x86)\Vim\vimfiles\autoload\pathogen.vim') }"

if not exist "C:\Program Files (x86)\Vim\vimfiles\autoload\pathogen.vim" (
	cls
	ECHO The download did not seem to finish correctly and needs to be completed manually.
	ECHO Internet explorer will open now when you press a key.
	ECHO Please copy and paste the contents of the file being opened in IE to:
	ECHO "C:\Program Files (x86)\Vim\vimfiles\autoload\pathogen.vim"
	PAUSE
	ECHO Opening explorer
	start "" iexplore.exe https://tpo.pe/pathogen.vim
	ECHO The script will now pause until the step is completed
	PAUSE
	)

if exist "C:\Program Files (x86)\Vim\vimfiles\autoload\pathogen.vim" (
	git clone https://github.com/scrooloose/nerdtree.git "C:\Program Files (x86)\Vim\vimfiles\bundle\nerdtree"
	:: git clone https://github.com/vim-scripts/pylint-mode.git "C:\Program Files (x86)\Vim\vimfiles\bundle\pylint-mode"
	git clone https://github.com/tmhedberg/SimpylFold.git "C:\Program Files (x86)\Vim\vimfiles\bundle\SimpylFold"
	git clone --depth=1 https://github.com/scrooloose/syntastic.git "C:\Program Files (x86)\Vim\vimfiles\bundle\syntastic"
	git clone https://github.com/tomtom/tcomment_vim.git "C:\Program Files (x86)\Vim\vimfiles\bundle\tcomment_vim"
	:: git clone https://github.com/klen/rope-vim.git "C:\Program Files (x86)\Vim\vimfiles\bundle\rope-vim"
	:: git clone https://github.com/SirVer/ultisnips.git  "C:\Program Files (x86)\Vim\vimfiles\bundle\ultisnips"
	git clone https://github.com/honza/vim-snippets.git "C:\Program Files (x86)\Vim\vimfiles\bundle\vim-snippets"
	)

if exist "C:\Program Files (x86)\Vim\_vimrc" (
	ECHO Making a backup of existing vimrc file
	ECHO "C:\Program Files (x86)\Vim\_vimrc"
	ECHO at backup location
	ECHO "C:\Program Files (x86)\Vim\_vimrc" "C:\Program Files (x86)\Vim\BACKUP_vimrc"
	ECHO f | xcopy /v/h/k "C:\Program Files (x86)\Vim\_vimrc" "C:\Program Files (x86)\Vim\BACKUP_vimrc"
	)

ECHO Trying to download Peters vimrc file with Powershell
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Pjotor87/VimWindows/master/_vimrc', 'C:\Program Files (x86)\Vim\_vimrc') }"

if not exist "C:\Program Files (x86)\Vim\_vimrc" (
	cls
	ECHO The download did not seem to finish correctly and needs to be completed manually.
	ECHO Internet explorer will open now when you press a key.
	ECHO Please copy and paste the contents of the file being opened in IE to:
	ECHO "C:\Program Files (x86)\Vim\_vimrc"
	PAUSE
	ECHO Opening explorer
	start "" iexplore.exe https://raw.githubusercontent.com/Pjotor87/VimWindows/master/_vimrc
	ECHO The script will now pause until the step is completed
	PAUSE
	)

ECHO Installation finished!
PAUSE
