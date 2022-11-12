function PhoneMainMenu_SC() {
    summary = AR.Summary({
        bg: "",
        env: ""
    });
    PhoneGlobals_Vert_SC();
    MakePhoneFrame();
    MakeMainPhotoButton({
        OnDone: function() {
            Scene.Change("PhonePhotoTake_SC")
        }
    });;
    MakeMainHomeButton({
        OnDone: function() {
            Scene.EndStream(Scene.streamName)
            summary.Send("CellButton", "AnimateDown")
        }
    });
    MakeMainBackButtonDisabled()
    MakeBackout({
        OnDone: function() {
            Scene.EndStream(Scene.streamName)
            summary.Send("CellButton", "AnimateDown")
        }
    });
    MakeWallpaper()
    MakeStatusBar()
    MakeCharms()
    toTalkButton = MakeAppButton({
        ovl: "UI_PhoneButtons_OVL",
        scene: "PhoneTalk_SC",
        upSource: [2, 2, 67, 83],
        downSource: [2, 85, 67, 166],
        active: function(this) {
            return Flags.Cellphone_Enable_Talk_FL
        }
    });
    toPhotoTakeButton = MakeAppButton({
        ovl: "UI_PhoneButtons_OVL",
        scene: "PhonePhotoTake_SC",
        upSource: [69, 2, 134, 83],
        downSource: [69, 85, 134, 166],
        active: function(this) {
            return Flags.Cellphone_Enable_Camera_FL
        }
    });
    if (!Brain.TUT_InTutorial_BR) {
        if (Brain.Bonus_BR) {
            toGamesButton = MakeAppButton({
                ovl: "UI_PhoneButtons_OVL",
                scene: "PhoneGames_SC",
                upSource: [136, 2, 201, 83],
                downSource: [136, 85, 201, 16],
                active: function(this) {
                    return Flags.Cellphone_Enable_Games_FL
                }
            });
        }
        toSettingsButton = MakeAppButton({
            ovl: "UI_PhoneButtons_OVL",
            scene: "PhoneSettings_SC",
            upSource: [203, 2, 268, 83],
            downSource: [203, 85, 268, 166],
            active: function(this) {
                return Flags.Cellphone_Enable_Options_FL
            }
        });
        toDiaryButton = MakeAppButton({
            ovl: "UI_PhoneButtons_OVL",
            scene: "PhoneDiary_SC",
            upSource: [69, 168, 134, 249],
            downSource: [69, 251, 134, 332]
        });
    }
}