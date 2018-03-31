
#IfWinActive, ahk_exe explorer.exe
{

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

    ; Edit selected file in Photoshop   WIN + ALT + P
    #!p::
        sel := Explorer_GetSelected()
        If (sel)
        {
            SplitPath, sel, file_name
            IfWinNotExist %file_name%*
            {
                Run, "C:\Program Files\Adobe\Adobe Photoshop CC 2015\Photoshop.exe" %sel%
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



    ; Create C++ project                ALT + F5 
    !F5::
        CUR_DIR := Explorer_GetPath()
        InputBox, PROJ_NAME, Projet C++, Nom de projet,,200,120,,,,,Project
        Run "C:\Users\ffran\Anaconda3\pythonw.exe" "C:\_util\auto_cpp_project\auto_main.py" %CUR_DIR% %PROJ_NAME% ,, Hide
        Return
    ; Create C++ class                  SHIFT + F5
    +F5::
        CUR_DIR := Explorer_GetPath()
        InputBox, CLASS_NAME, Classe C++, Nom de classe,,200,120,,,,,Classe
        Run "C:\Users\ffran\Anaconda3\pythonw.exe" "C:\_util\auto_cpp_project\auto_class.py" %CUR_DIR% %CLASS_NAME% ,, Hide
        Return
    ; Create C++ file                   CTRL + F3
    ^F3::
        CUR_DIR := Explorer_GetPath()
        Run touch %CUR_DIR%/main.cpp ,, Hide
        Return
    ; Create Python file                CTRL + F2
    ^F2::
        CUR_DIR := Explorer_GetPath()
        Run touch %CUR_DIR%/main.py ,, Hide
        Return
    ; Run Python file                   ALT + F2
    !F2::
        CUR_FILE := Explorer_GetSelected()
        Run python %CUR_FILE%
        Return
    ; Create text file                  CTRL + F1
    ^F1::
        CUR_DIR := Explorer_GetPath()
        Run touch %CUR_DIR%/______notes.txt ,, Hide
        Return
 
}
#IfWinActive
