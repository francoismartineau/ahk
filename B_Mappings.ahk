; LCTRL / LALT                          RCTRL / RALT
RAlt::LAlt
VKDF::LCtrl

; Alt + F4                              CTRL + Q
^q::Send !{f4}


;-- Exist any kind of console           CTRL + Q
#IfWinActive, ahk_class ConsoleWindowClass
{
    ^Q::Send exit{Enter}
        Return
}
