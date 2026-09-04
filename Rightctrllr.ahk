#Requires AutoHotkey v2.0

; Rightcontroller Copyrighted real!11!! just kidding , you can mess around with the code however you want , BUT if you plan on stealling it , atleast give some credit!
>^1::Send("{Volume_Mute}")         ; RCtrl + 1 = Speaker Mute
>^2::Send("{Volume_Down}")         ; RCtrl + 2 = Volume Down
>^3::Send("{Volume_Up}")           ; RCtrl + 3 = Volume Up
>^4::Send("#!k")                   ; RCtrl + 4 = Toggle Microphone Mute (Win + Alt + K)
>^5::ChangeBrightness(-10)         ; RCtrl + 5 = Brightness Down
>^6::ChangeBrightness(10)          ; RCtrl + 6 = Brightness Up
>^7::Send("#p")                    ; RCtrl + 7 = Win + P (Project Menu)
>^8::Send("#i")                    ; RCtrl + 8 = Win + I (Settings)
>^9::DllCall("LockWorkStation")    ; RCtrl + 9 = Win + L (Lock PC)
>^0::Send("!{Tab}")                ; RCtrl + 0 = Alt + Tab
>^-::Run("calc.exe")               ; RCtrl + - = Open Calculator
>^=::Send("#a")                    ; RCtrl + = = Win + A (Quick Settings)
>^SC027::Send("{Left}")            ; RCtrl + ; = Left arrow key
>^SC028::Send("{Right}")           ; RCtrl + ' = Right arrow key

; Brightness function thingy!
ChangeBrightness(amount) {
    for monitor in ComObjGet("winmgmts:\\.\root\wmi").ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods") {
        current := ComObjGet("winmgmts:\\.\root\wmi").ExecQuery("SELECT * FROM WmiMonitorBrightness").ItemIndex(0).CurrentBrightness
        monitor.WmiSetBrightness(0, Max(0, Min(100, current + amount)))
    }
}
