
#IfWinActive, ahk_exe explorer.exe
{
    ; Create blank file                 CTRL + SHIFT + F
    ^+f::
        path := Explorer_GetPath()
        Run touch %path%\______.txt
        Return

    ; Toggle hidden files               CTRL + SHIFT + H
    +^h::
        RegRead, ValorHidden, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
        if ValorHidden = 2
          RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
        else
          RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
        Send {F5}
        Return 
    
    ; Copy selected file's path         CTRL + SHIFT + C
    +^c::
        sel := Explorer_GetSelected()
        If (sel)
        {
            clipboard := sel
        }
        Return   
    
    ; Open selected file with Vim       WIN + ALT + V
    #!v::
        sel := Explorer_GetSelected()
        If (sel)
        {
            SplitPath, sel, file_name
            IfWinNotExist %file_name%*
            {
                Run, "C:\Program Files (x86)\Vim\vim80\gvim.exe" %sel%
                Sleep, 500
            }
            IfWinExist %file_name%*
            {
                WinActivate 
            }
        }
        Return

    ; Open current folder in CMD        WIN + ALT + C
    #!c::
        sel := Explorer_GetPath()
        If (sel)
        {
            Run, C:\_util\other\OpenInConsole.bat %sel%
        }
        IfWinExist *cmd.exe
        {
            WinActivate
        }
        Return


    ; Empty recycle bin                 CTRL + SHIFT + DEL
    ^+Del::
            Run "C:\_util\recyclebin\empty_recycle_bin.vbs"
            MsgBox,,Trash,Is empty,
            Return
    
    ; Open recycle bin                  CTRL + SHIFT + ALT + DEL
    ^+!Del::
            Run "C:\_util\recyclebin\open_recycle_bin.vbs"
            Sleep, 500
            IfWinExist Recycle Bin
            WinActivate
            Return


    ; Resize window                     CTRL + WIN + Z
    ^#z::send !{space}s
    ; Move window                       ALT + WIN + Z
    !#z::send !{space}m


    ; Create C++ project            ALT + F5 
    !F5::
        CUR_DIR := Explorer_GetPath()
        InputBox, PROJ_NAME, Projet C++, Nom de projet,,200,120,,,,,Project
        Run "C:\Users\ffran\Anaconda3\pythonw.exe" "C:\_util\auto_cpp_project\auto_main.py" %CUR_DIR% %PROJ_NAME%
        Return
    ; Create C++ class              SHIFT + F5
    +F5::
        CUR_DIR := Explorer_GetPath()
        InputBox, CLASS_NAME, Classe C++, Nom de classe,,200,120,,,,,Classe
        Run "C:\Users\ffran\Anaconda3\pythonw.exe" "C:\_util\auto_cpp_project\auto_class.py" %CUR_DIR% %CLASS_NAME%
        Return
 
}
#IfWinActive
