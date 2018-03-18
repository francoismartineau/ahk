
#IfWinActive, ahk_class Chrome_WidgetWin_1
{
    ; Close current tab only        CTRL + Q
    ^q::Send ^w

    ; Bookmarks                     ALT + 1 .. 0
    !1::Send ^l{f6}{Enter}
    !2::Send ^l{f6}{Right}{Enter}
    !3::Send ^l{f6}{Right}{Right}{Enter}
    !4::Send ^l{f6}{Right}{Right}{Right}{Enter}
    !5::Send ^l{f6}{Right}{Right}{Right}{Right}{Enter}
    !6::Send ^l{f6}{Right}{Right}{Right}{Right}{Right}{Enter}
    !7::Send ^l{f6}{Right}{Right}{Right}{Right}{Right}{Right}{Enter}
    !8::Send ^l{f6}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Enter}
    !9::Send ^l{f6}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Enter}
    !0::Send ^l{f6}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Enter}

    ; Switch to François             CTRL + F12
    ^F12::
        Send ^+m
        Sleep, 50
        Send {Down}
        Sleep, 50
        Send {Down}
        Sleep, 50
        Send {Enter}
        Sleep, 1000
        Send {Right}{Right}{Enter}
        Sleep, 200
        Send {LWin down}{Right}{LWin up}
        return

    ; Switch to Farine              ALT + F12
    !F12::
        Send ^+m
        Sleep, 50
        Send {Down}
        Sleep, 50
        Send {Down}
        Sleep, 50
        Send {Enter}
        Sleep, 1000
        Send {Right}{Enter}
        Sleep, 200
        Send {LWin down}{Left}{LWin up}
        return
    return
}
