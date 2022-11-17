//ЗДЕСЬ ВСЁ ХОРОШО, ПРОСТО ВРЕМЕННО, ПОКА НЕТ РЕАЛИЗАЦИЮЮ СМЕНЫ СЦЕН И ДРУГОГО ПОРЯДКА ДЕЙСТВИЙ
function s0() {
    var splashSFX = AR.Sound({
        sounds: "VEN_Splash_SFX",
        channel: "Theme",
        volume: 0.6,
        loop: false,
        active: true,
        OnEnd: function() {
            Scene.LetsGo("TitleMenu_SC", false);
        }
    });
    var HER_Logo_ANIM = AR.Movie({
        movie: "HER_Logo_ANIM",
        type: "anim",
        z: 5,
        active: true,
        id: "HER_Logo_ANIM",
        onScreen: Viewport.uiSize,
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
        type: "anim",
        z: 4,
        active: false,
        id: "nancyANIM",
        onScreen: Viewport.uiSize,
        OnEnd: function() {
            fourSeconds.start();
            document.querySelector("#nancyDrewOVL").style.visibility = "visible";
            document.querySelector("#tileMenuBG").style.opacity = 1;
        }
    });
    var fourSeconds = AR.Timer({
        duration: 4,
        OnEnd: function() {
            twoSeconds.start();
            
        }
    });
    var mainMenuOVL = AR.Overlay({
        ovl: "UI_MainMenu_OVL",
        id: "mainMenuOVL",
        source: [0, 0, 1024, 94],
        onScreen: [0, 674, 1024, 768],
        z: 1,
        transition: 1,
        active: false
    });
    var twoSeconds = AR.Timer({
        duration: 2,
        OnEnd: function() {
            fourSeconds2.start();
            document.querySelector("#titleOVL").style.opacity = 1;
        }
    });
    fourSeconds2 = AR.Timer({
        duration: 6,
        OnEnd: function() {
            document.querySelector("#mainMenuOVL").style.opacity = 1;
        }
    })
    var tileMenuBG = AR.Movie({
        movie: "MID_MainMenu_BG",
        id: "tileMenuBG",
        transition: 4,
        onScreen: Viewport.uiSize,
        active: false,
        z: 0
    });
    var nancyDrewOVL = AR.Overlay({
        ovl: "UI_MainMenuTitleND_OVL",
        id: "nancyDrewOVL",
        source: [0, 0, 808, 366],
        onScreen: [108, 83, 916, 449],
        z: 4,
        active: false
    });
    var titleOVL = AR.Overlay({
        ovl: "MID_MainMenuTitle_OVL",
        id: "titleOVL",
        source: [0, 0, 808, 366],
        onScreen: [108, 83, 916, 449],
        z: 4,
        transition: 2,
        active: false
    });
    var skip_HS = AR.Hotspot({
        onScreen: Viewport.uiSize,
        cursor: "None",
        z: 5,
        OnUp: function() {
            let s = document.querySelector("#VEN_Splash_SFX");
            if (s) s.pause();
            let h = document.querySelector("#HER_Logo_ANIM");
            if (h) h.pause();
            let n = document.querySelector("#nancyANIM");
            if (n) n.pause();
            Scene.LetsGo("TitleMenu_SC");
        }
    })
    return [splashSFX, HER_Logo_ANIM, nancyANIM, tileMenuBG, nancyDrewOVL, titleOVL, mainMenuOVL, skip_HS];
    //var Initialize = AR.Override({
    //    RunOnce: function() {
    //    Brain.Bonus_BR = true;
    //    //PhoneManager.SetAntenna(2);
    //    Flags.Cellphone_Enable_Wallpaper_FL = true;
    //    Flags.Cellphone_Enable_Menu_FL = true;
    //    Flags.Cellphone_Enable_Camera_FL = true;
    //    Flags.Cellphone_Enable_Gallery_FL = true;
    //    Flags.Cellphone_Enable_Games_FL = true;
    //    Flags.Cellphone_Enable_Messages_FL = true;
    //    Flags.Cellphone_Enable_Options_FL = true;
    //    Flags.Cellphone_Enable_Talk_FL = false;
    //    Flags.Cellphone_Enable_Hints_FL = false;
    //    Flags.Cellphone_Enable_Games_FL = Brain.Bonus_BR;
    //    if (Load.Attic("TutorialReplay") == true) {
    //        Save.Attic("TutorialReplay", false);
    //        Scene.Change("TUT_Start_SC");
    //    }
    //    else if (Load.Attic("SkipToBadges") == true) {
    //        Save.Attic("SkipToBadges", false);
    //        Scene.Change("Badges_SC");
    //    }
    //    else {
    //        Scene.Change(Scene.streamName, "TitleMenu_SC");
    //    }
    //    },
    //    active: false
    //})
    //var defaultOptions = AR.Override({
    //    RunOnce: function() {
    //    if (Load.Attic("fastConvo") == undefined) {
    //        Save.Attic("fastConvo", true)
    //    }
    //    }
    //})
    //var skip_HS = AR.Hotspot({
    //    onScreen: Viewport.uiSize,
    //    cursor: "None",
    //    OnDone: function() {
    //    Sound.Stop("FX4")
    //    Sound.Stop("FX5")
    //    Sound.Stop("FX6")
    //    }
    //})
    
}
//var themeSound = AR.Sound({
//    sounds: "MainTheme_SFX",
//    channel: "Theme",
//    volume: 0.75,
//    loop: true,
//    active: false
//});