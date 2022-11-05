//ЗДЕСЬ ВСЁ ХОРОШО, ПРОСТО ВРЕМЕННО, ПОКА НЕТ РЕАЛИЗАЦИЮЮ СМЕНЫ СЦЕН И ДРУГОГО ПОРЯДКА ДЕЙСТВИЙ
function s0() {
    var splashSFX = AR.Sound({
        sounds: "VEN_Splash_SFX",
        channel: "Theme",
        volume: 0.6,
        loop: false,
        active: true
        //active: function(this)
        //  return partner2LogoANIM.done
        //end
    });
    var HER_Logo_ANIM = AR.Movie({
        movie: "HER_Logo_ANIM",
        z: 5,
        active: true,
        id: "HER_Logo_ANIM",
        OnEnd: function() {
        oneSecond.start();
        }
    });
    var oneSecond = AR.Timer({
        duration: 1,
        OnEnd: function() {
        document.querySelector("#nancyANIM").play();
        }
    });
    var nancyANIM = AR.Movie({
        movie: "ND_LOGO_ANIM",
        z: 5,
        active: false,
        id: "nancyANIM",
        OnEnd: function() {
        document.querySelector("#game").append(nancyDrewOVL);
        }
    });
    var nancyDrewOVL = AR.Overlay({
        ovl: "UI_MainMenuTitleND_OVL",
        source: [0, 0, 808, 366],
        onScreen: [108, 83, 916, 449],
        z: 4,
    })
    var Initialize = AR.Override({
        RunOnce: function() {
        Brain.Bonus_BR = true;
        PhoneManager.SetAntenna(2);
        Flags.Cellphone_Enable_Wallpaper_FL = true;
        Flags.Cellphone_Enable_Menu_FL = true;
        Flags.Cellphone_Enable_Camera_FL = true;
        Flags.Cellphone_Enable_Gallery_FL = true;
        Flags.Cellphone_Enable_Games_FL = true;
        Flags.Cellphone_Enable_Messages_FL = true;
        Flags.Cellphone_Enable_Options_FL = true;
        Flags.Cellphone_Enable_Talk_FL = false;
        Flags.Cellphone_Enable_Hints_FL = false;
        Flags.Cellphone_Enable_Games_FL = Brain.Bonus_BR;
        if (Load.Attic("TutorialReplay") == true) {
            Save.Attic("TutorialReplay", false);
            Scene.Change("TUT_Start_SC");
        }
        else if (Load.Attic("SkipToBadges") == true) {
            Save.Attic("SkipToBadges", false);
            Scene.Change("Badges_SC");
        }
        else {
            Scene.Change(Scene.streamName, "TitleMenu_SC");
        }
        },
        active: false
    })
    var defaultOptions = AR.Override({
        RunOnce: function() {
        if (Load.Attic("fastConvo") == undefined) {
            Save.Attic("fastConvo", true)
        }
        }
    })
    var skip_HS = AR.Hotspot({
        onScreen: Viewport.uiSize,
        cursor: "None",
        OnDone: function() {
        Sound.Stop("FX4")
        Sound.Stop("FX5")
        Sound.Stop("FX6")
        }
    })
}
//var themeSound = AR.Sound({
//    sounds: "MainTheme_SFX",
//    channel: "Theme",
//    volume: 0.75,
//    loop: true,
//    active: false
//});