function TitleMenu_SC(anim = true) {
    let sum = AR.Summary({
        env: "OPN",
        bg: "toast_BG",
        z: 10
    });
    let tileMenuBG = AR.Movie({
        movie: "MID_MainMenu_BG",
        //source: Viewport.uiSize,
        onScreen: Viewport.uiSize,
        pauseOnLastFrame: true
    });
    let titleOVL = AR.Overlay({
        ovl: "MID_MainMenuTitle_OVL",
        source: [0, 0, 808, 366],
        onScreen: [108, 83, 916, 449],
        z: 4
    });
    let nancyDrewOVL = AR.Overlay({
        ovl: "UI_MainMenuTitleND_OVL",
        source: [0, 0, 808, 366],
        onScreen: [108, 83, 916, 449],
        z: 3
    });
    let mainMenuOVL = AR.Overlay({
        ovl: "UI_MainMenu_OVL",
        source: [0, 0, 1024, 94],
        onScreen: [0, 674, 1024, 768],
        z: 1
    });
    let newGameButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [43, 730, 169, 760],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 2, 128, 32],
            onScreen: [43, 730, 169, 760]
        }),
        OnDown: function() {
            uiFrame.classList.remove("disabled");
            Scene.LetsGo("s2600");
            themeSound.pause();
            themeSound.currentTime = 0;
            //Scene.Change(Scene.streamName, "Badges_SC")
        }
    });
    let loadGameButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [203, 730, 329, 760],
            cursor:"MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 34, 128, 64],
            onScreen: [203, 730, 329, 760]
        }),
        OnDown: function() {
            //Scene.BeginStream({
            //    stream: "MainMenuPopup",
            //    scene: "UI_TM_Load_SC",
            //    captureInput: true
            //})
        }
    });
    let helpButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [364, 730, 473, 760],
            cursor:"MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 66, 111, 96],
            onScreen: [364, 730, 473, 760]
        }),
        OnDown: function() {
            Scene.Change("TUT_Start_SC")
        }
    })
    let optionsButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [503, 730, 610, 760],
            cursor:"MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 98, 109, 128],
            onScreen: [503, 730, 610, 760]
        }),
        OnDown: function() {
            //Scene.BeginStream({
            //    stream: "MainMenuPopup",
            //    scene: "UI_TM_Options_SC",
            //    captureInput: true
            //})
        }
    });
    let extrasButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [635, 730, 742, 760],
            cursor:"MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 130, 109, 160],
            onScreen: [635, 730, 742, 760]
        }),
        OnDown: function() {
            //Scene.BeginStream({
            //    stream: "MainMenuPopup",
            //    scene: "UI_Extras_SC",
            //    captureInput: true
            //})
        }
    });
    let moreNDButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [761, 730, 884, 760],
            cursor:"MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 162, 125, 192],
            onScreen: [761, 730, 884, 760]
        }),
        OnDown: function() {
            //Scene.BeginStream({
            //    stream: "MoreNDStream",
            //    scene: "UI_MoreND_SC",
            //    captureInput: true
            //})
        }
    });
    let quitButton = AR.Button({
        hs: AR.Hotspot({
            onScreen: [890, 730, 1006, 760],
            cursor:"MenuHot"
        }),
        overOvl: AR.Overlay({
            ovl: "UI_MainMenu_Rollover_OVL",
            source: [2, 194, 118, 224],
            onScreen: [890, 730, 1006, 760]
        }),
        OnDown: function() {
            //Game.Exit()
        }
    });
    var themeSound = AR.Sound({
        sounds: "MainTheme_SFX",
        channel: "Theme",
        volume: 0.75,
        loop: true,
        active: !anim
    });
    let coverBG = AR.Movie({
        movie: "toast_BG",
        id: "coverBG",
        source: Viewport.uiSize,
        onScreen: Viewport.uiSize,
        loop: true,
        z: 8,
        duration: 2,
        opacity: 0,
        animationName: "fadeOut"
    });
    var twoSeconds = AR.Timer({
        duration: 2,
        OnEnd: function() {
            themeSound.play();
        }
    });
    let returnArray = [sum, tileMenuBG, titleOVL, nancyDrewOVL, mainMenuOVL, newGameButton, loadGameButton, helpButton, optionsButton, extrasButton, moreNDButton, quitButton];
    if(anim == true) {
        returnArray.push(coverBG);
        twoSeconds.start();
        
    }
    return returnArray;
}