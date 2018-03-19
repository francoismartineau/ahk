#UseHook
#NoTrayIcon
SetTitleMatchMode, Regex
Gui,+ToolWindow
#Include C:\_util\other\AHKLib\ExplorerGetPath.ahk
#Include C:\_util\ahk\B_Mappings.ahk
#Include C:\_util\ahk\C_Chrome.ahk
#Include C:\_util\ahk\D_WindowsExplorer.ahk

;-- Open notes                          F10
F10::
    IfWinNotExist, _F10.txt*
    {
        Run "C:\_notes\_F10.txt"
        Sleep, 500
    }
    IfWinExist, _F10.txt*
    {
        WinActivate 
    }
    else
        Return


;-- Open Folders                        WIN + ALT + NUMBERS
!#1::Run "C:\_notes"                            ; 1     _notes 
!#2::Run "C:\_notes\_Scolaire\_cours"           ; 2     _cours
!#3::Run "C:\"                                  ; 3    C:\
!#4::Run "C:\Users\ffran\Downloads"             ; 4    Downloads
!#5::Run "C:\Users\ffran\OneDrive\Pictures"     ; 5    Pictures
!#0::Run "C:\Users\ffran\Google Drive"          ; 0    Google Drive folder









;----------------------------------------------------------------------------------
;-- SCRIPTS -----------------------------------------------------------------------

;-- Consult Relire_Fichiers          CTRL + F10
^F10::
    IfWinNotExist paths*
    {  
        Run "C:\Program Files (x86)\Vim\vim80\gvim.exe" "C:\_util\relire_fichiers\paths"
        Sleep, 500
    }
    IfWinExist paths*
    {
        WinActivate
    }
    Return

;-- Execute Relire_Fichiers         CTRL + ALT + F10
^!F10::Run "C:\Windows\System32\schtasks.exe" "/run" "/tn" "my_tasks\RelireFichiers"

;-- Trigger Backup Script           WIN + 2
#2::
    Send, {LWinDown}{2}{LWinUp} ;send win 2 anyway
    ;Run, "C:\Users\ffran\Anaconda3\python.exe" "C:\_util\tar_backup\backup.py"
    ;Run, "C:\Windows\System32\schtasks.exe" "/run" "/tn" "my_tasks\tarbackup"
    Return

;-- Run SSH SFTP Client             F8
F8::Run, "C:\Users\ffran\Anaconda3\python.exe" "C:\_util\ssh_sftp_client\CLIENT.py"

;-- Make screen go black            CTRL + SHIFT + PRTSCR
^+VK2C::Run "C:\_util\other\sleepMonitor.vbs"










;----------------------------------------------------------------------------------
;-- APPLICATIONS ------------------------------------------------------------------

;-- KeyPass                             WIN + ALT + P
#!p::
    Run "C:\_notes\keypass.kdbx"
    Sleep, 500
    IfWinExist .*keypass.kdbx
    WinActivate
    Return

;-- Snipping Tool                       PRTSCR
VK2C::
    Run, SnippingTool.exe
    Sleep, 500
    Send {Ctrl down}n{Ctrl up}
    Return

;-- Python console                      F9      
#IfWinNotActive, ahk_class TFruityLoopsMainForm 
{
    F9::
        Run Ipython.exe
        Sleep, 200
        Send {LWin down}{Right}
        Send {Down}
        Send {LWin up}
        Return
}
#IfWinNotActive
