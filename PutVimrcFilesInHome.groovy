@ECHO OFF
cd %USERDIR%
SET BACKUP_DIR=Dropbox\backups
echo Working in %USERDIR%
move .vimrc %BACKUP_DIR%
move .gvimrc %BACKUP_DIR%
copy %USERDIR%\vimfiles\.?vimrc %USERDIR%
