function PhoneGlobals_SC() {
    PhoneSkinFilter_SC();
    AreaTag("PREVENTINVENTORY")
    AR.Sink({
        cursor: "MagGlass",
        onScreen: Viewport.uiSize,
        z: -10
    })
    var sharedPhonesounds = {
        menu: AR.Sound({
            sounds: "Phone_UI_02_SFX",
            channel: "PhoneFX",
            active: false,
            volume: 0.4
        }),
        backout: AR.Sound({
            sounds: "Phone_UI_01_SFX",
            channel: "PhoneFX",
            active: false,
            volume: 0.4
        }),
        messageSound: AR.Sound({
            sounds: "Phone_UI_Text_03_SFX",
            channel: "PhoneFX",
            active: false
        }),
        alarmSound: AR.Sound({
            sounds: "Alarm_Fire_Loop_sfx",
            channel: "PhoneFX",
            active: false
        }),
        appButton: AR.Sound({
            sounds: [
                "Phone_UI_App_01_SFX",
                "Phone_UI_App_02_SFX",
                "Phone_UI_App_03_SFX"
            ],
            channel: "PhoneFX",
            active: false,
            volume: 0.8
        }),
        selectSound: AR.Sound({
            sounds: [
                "Phone_UI_App_01_SFX",
                "Phone_UI_App_02_SFX",
                "Phone_UI_App_03_SFX"
            ],
            channel: "PhoneFX",
            active: false,
            volume: 0.8
        }),
        ringBack: AR.Sound({
            sounds: "Cell_Ring_Back_01_SFX",
            channel: "PhoneFX",
            volume: 0.6,
            active: false
        }),
        ringTone: AR.Sound({
            sounds: "Cell_Ring_Tone_01_SFX",
            channel: "PhoneFX",
            volume: 0.6,
            active: false
        }),
        CantUseThisVO: AR.Sound({
            sounds: "silence",
            channel: "PlayerVoice",
            volume: 0.85,
            active: false
        }),
        CantUsePhoneVO: AR.Sound({
            sounds: "silence",
            channel: "PlayerVoice",
            volume: 0.85,
            active: false
        })
    }
}