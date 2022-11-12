function PhoneGlobals_Vert_SC() {
    PhoneGlobals_SC();
    AppBackgroundDest = [2, 22, 352, 618].LeftTopSet(336, 20);
    StatusBarSrc = [2, 2, 352, 20];
    StatusBarDest = [2, 2, 352, 20].LeftTopSet(336, 2);
    BatteryDest = [661, 5, 685, 18];
    SignalDest = [337, 5, 355, 18];
    TitleDest = [392, 2, 632, 19];
    MainHomeButtonDest = [493, 616, 529, 652];
    MainHomeButtonHS = [467, 616, 556, 690];
    MainHomeButtonDownSrc = [866, 221, 902, 257];
    MainBackButtonDest = [356, 616, 392, 652];
    MainBackButtonHS = [329, 616, 418, 690];
    MainBackButtonDownSrc = [866, 259, 902, 295];
    MainBackButtonDisabledSrc = [547, 533, 583, 569];
    MainPhotoButtonDest = [630, 616, 666, 652];
    MainPhotoButtonHS = [604, 616, 693, 690];
    MainPhotoButtonDownSrc = [866, 183, 902, 219];
    BackNavRect = [0, 0, 1024, 690];
    BackSinkRect = [275, 0, 750, 690];
    CharmDest = {
        left: [116, 0, 335, 581],
        right: [687, 0, 906, 581]
    }
    charms = {
        1: {
            src: [2, 2, 221, 583],
            rect: "left"
        },
        3: {
            src: [223, 2, 442, 583],
            rect: "left"
        },
        4: {
            src: [444, 2, 663, 583],
            rect: "left"
        },
        6: {
            src: [665, 2, 884, 583],
            rect: "left"
        },
        2: {
            src: [886, 2, 1105, 583],
            rect: "right"
        },
        5: {
            src: [1107, 2, 1326, 583],
            rect: "right"
        },
        7: {
            src: [1328, 2, 1547, 583],
            rect: "right"
        }
    };
    wallpaperOptions = [
        {
            autotextRef: "PHONE_BG01",
            ovl: "UI_PhoneWP_OVL",
            tree: "",
            source: [2, 2, 352, 616],
            thumbSrc: [1410, 2, 1462, 93],
            onScreen: [2, 2, 352, 616].LeftTopSet(336, 2)
        },
        {
            autotextRef: "PHONE_BG02",
            ovl: "UI_PhoneWP_OVL",
            tree: "",
            source: [354, 2, 704, 616],
            thumbSrc: [1410, 95, 1462, 186],
            onScreen: [354, 2, 704, 616].LeftTopSet(336, 2)
        },
        {
            autotextRef: "PHONE_BG03",
            ovl: "UI_PhoneWP_OVL",
            tree: "",
            source: [706, 2, 1056, 616],
            thumbSrc: [1410, 188, 1462, 279],
            onScreen: [706, 2, 1056, 616].LeftTopSet(336, 2)
        },
        {
            autotextRef: "PHONE_BG04",
            ovl: "UI_PhoneWP_OVL",
            tree: "",
            source: [1058, 2, 1408, 616],
            thumbSrc: [1410, 281, 1462, 372],
            onScreen: [1058, 2, 1408, 616].LeftTopSet(336, 2)
        },
        {
            autotextRef: "PHONE_BG05",
            photoData: PhotoManager.Get("wallpaper")[1],
            tree: "LOADSAVE",
            source: [177, 0, 350, 614],
            thumbSrc: [1410, 374, 1462, 465],
            onScreen: [336, 2, 350, 614]
        }
    ];
    batteryOptions = {
        0: [616, 595, 640, 608],
        1: [570, 595, 594, 608],
        2: [524, 595, 548, 608]
    };
    signalOptions = {
        0: [596, 595, 614, 608],
        1: [550, 595, 568, 608],
        2: [504, 595, 522, 608]
    };
    titleOptions = {
        contacts: [706, 2, 946, 19],
        messages: [706, 59, 946, 76],
        games: [706, 21, 946, 38],
        settings: [706, 40, 946, 57],
        diary: [706, 78, 946, 95]
    };
    appLocations = [
        [353, 37],
        [435, 37],
        [517, 37],
        [599, 37],
        [353, 120],
        [435, 120],
        [517, 120],
        [599, 120],
        [353, 203]
    ];
    function MakePhoneFrame(inputTable) {
        let ovl = AR.Overlay({
          ovl: "UI_PhoneVert_OVL",
          z: -0.9
        });
        return ovl;
    };
    function MakeAppBackground() {
        let ovl = AR.Overlay({
            ovl: "UI_Phone_OVL",
            source: [2, 22, 352, 618],
            onScreen: AppBackgroundDest,
            z: -0.4
        })
        return ovl
    };
    function MakeWallpaper() {
        let wallpaperID = PhoneManager.GetWallpaper()
        let wallpaperOption
        for (key, option in ipairs(wallpaperOptions)) {
            if (option.autotextRef == wallpaperID) {
                wallpaperOption = option
                break
            }
        }
        if (!wallpaperOption) {
            error(string.format("There is no wallpaper '%s'. Check options code.", wallpaperID))
        }
        if (!wallpaperOption.ovl) {
            if (!wallpaperOption.photoData) {
                return
            }
            wallpaperOption.ovl = wallpaperOption.photoData.ovl
        }
        wallpaperOption.z = -0.5
        let wallpaperOvl = AR.Overlay(wallpaperOption)
        return wallpaperOvl
    };
    function MakeStatusBar(title) {
        let titleSource = titleOptions[title]
        let bar = AR.Overlay({
            ovl: "UI_Phone_OVL",
            source: StatusBarSrc,
            onScreen: StatusBarDest,
            z: -0.25
        });
        let battery = AR.Overlay({
            ovl: "UI_Phone_OVL",
            source: batteryOptions[PhoneManager.GetBattery()],
            onScreen: BatteryDest,
            z: -0.25
        });
        let signal = AR.Overlay({
            ovl: "UI_Phone_OVL",
            source: signalOptions[PhoneManager.GetAntenna()],
            onScreen: SignalDest,
            z: -0.25
        });
        if (titleSource == undefined) {
            let title = AR.Overlay({
                ovl: "UI_Phone_OVL",
                source: titleSource,
                onScreen: TitleDest,
                z: -0.25
            })
        }
        return [bar, title, battery, signal]
    };
    function MakeCharms() {
        let activeCharms = {}
        for (id, charmData in ipairs(charms)) {
            activeCharms[id] = AR.Overlay({
                ovl: "UI_PhoneCharm_OVL",
                source: charmData.src,
                onScreen: CharmDest[charmData.rect],
                z: 2 + 0.1 * id,
                active: function(this) {
                    return Brain["Got_Charm" + S(id) + "_BR"]
                }
            })
        }
    };
    function MakeClock(inputTable) {
        PuzzleUtilities_SC();
        let hourReadout = MakeReadout({
            1: inputTable.hours[1],
            2: inputTable.hours[2],
            digits: inputTable.numberSources,
            ovl: inputTable.ovl,
            leadingZeroes: false
        });
        let minuteReadout = MakeReadout({
            1: inputTable.minutes[1],
            2: inputTable.minutes[2],
            digits: inputTable.numberSources,
            ovl: inputTable.ovl,
            leadingZeroes: true
        });
        let ampmReadout = MakeReadout({
            1: inputTable.ampm,
            digits: inputTable.ampmSources,
            ovl: inputTable.ovl,
            leadingZeroes: true
        });
        let clock = {}
        function clock_SetTime(this, time) {
            time.hours = time.hours % 24;
            time.minutes = time.minutes % 60;
            if (PhoneManager.ClockIs24()) {
                ampmReadout.active = false
                hourReadout.leadingZeroes = true
                hourReadout.value = time.hours
                minuteReadout.value = time.minutes
            }
            else {
                ampmReadout.active = true
                ampmReadout.value = (time.hours >= 12) ? 1 : 0
                hourReadout.leadingZeroes = false
                hourReadout.value = (time.hours - 1) % 12 + 1
                minuteReadout.value = time.minutes
            }
            clock.hours, clock.minutes = time.hours, time.minutes;
        }
        if (inputTable.time) {
            clock.hours, clock.minutes = inputTable.time.hours, inputTable.time.minutes;
        }
        else {
            clock.hours, clock.minutes = 0, 0;
        }
        clock_SetTime(clock);
        return clock;
    };
    function MakeAutomaticClock(inputTable) {
        let clock = MakeClock(inputTable)
        let timeWatcher = AR.Override({
            Run: function(this) {
                clock.SetTime(Player.time)
            }
        });
        return clock
    };
    function MakeMainHomeButton(inputTable) {
        let button = AR.Button({
            hs: AR.Hotspot({
                onScreen: MainHomeButtonHS,
                cursor: "Point"
            }),
            downOvl: AR.Overlay({
                ovl: "UI_Phone_OVL",
                source: MainHomeButtonDownSrc,
                onScreen: MainHomeButtonDest
            }),
            OnUp: function(this) {
                sharedPhoneSounds.menu.Restart()
                inputTable.OnDone()
            },
            z: 1,
            active: (inputTable.active == undefined) ? inputTable.active : function() {
                return !Flags.CELLPHONE_PreventBackOut_FL
            }
        })
        return button
    };
    function MakeMainBackButtonDisabled(inputTable) {
        let ovl = AR.Overlay({
            ovl: "UI_Phone_OVL",
            source: MainBackButtonDisabledSrc,
            onScreen: MainBackButtonDest
        });
        return ovl;
    };
    function MakeMainBackButton(inputTable) {
        let button = AR.Button({
            hs: AR.Hotspot({
                onScreen: MainBackButtonHS,
                cursor: "Point"
            }),
            downOvl: AR.Overlay({
                ovl: "UI_Phone_OVL",
                source: MainBackButtonDownSrc,
                onScreen: MainBackButtonDest
            }),
            OnUp: function(this) {
                sharedPhoneSounds.menu.Restart()
                inputTable.OnDone()
            },
            z: 1,
            active: (inputTable.active == undefined) ? inputTable.active : true
        });
        return button;
    };
    function MakeMainPhotoButton(inputTable) {
        let button = AR.Button({
            hs: AR.Hotspot({
                onScreen: MainPhotoButtonHS,
                cursor: "Point"
            }),
            downOvl: AR.Overlay({
                ovl: "UI_Phone_OVL",
                source: MainPhotoButtonDownSrc,
                onScreen: MainPhotoButtonDest
            }),
            OnUp: function(this) {
                sharedPhoneSounds.menu.Restart()
                inputTable.OnDone()
            },
            z: 1,
            active: (inputTable.active == undefined) ? inputTable.active : function() {
                return Flags.Cellphone_Enable_Camera_FL
            }
        })
        return button;
    };
    function MakeBackout(inputTable) {
        let hotspot = AR.Hotspot({
            onScreen: (inputTable.rect == undefined) ? inputTable.rect : BackNavRect,
            cursor: "Back",
            z: 0,
            OnDone: function(this) {
                sharedPhoneSounds.backout.Restart()
                inputTable.OnDone()
            },
            active: (inputTable.active == nil) ? inputTable.active : function() {
                return !Flags.Cellphone_PreventBackOut_FL
            }
        });
        let sink = AR.Sink({
            onScreen: BackSinkRect,
            cursor: "MagGlass",
            z: 0,
            active: (inputTable.active == undefined) ? inputTable.active : true
        });
    };
    function MakeAppButton(inputTable) {
        let posTL = table.remove(appLocations, 1)
        let button = AR.Button({
            hs: AR.Hotspot({
                onScreen: inputTable.upSource.LeftTopSet(posTL),
                cursor: "Point"
            }),
            upOvl: AR.Overlay({
                ovl: inputTable.ovl,
                source: inputTable.upSource,
                onScreen: inputTable.upSource.LeftTopSet(posTL)
            }),
            downOvl: AR.Overlay({
                ovl: inputTable.ovl,
                source: inputTable.downSource,
                onScreen: inputTable.downSource.LeftTopSet(posTL)
            }),
            overOvl: AR.Overlay({
                ovl: inputTable.ovl,
                source: inputTable.upSource,
                onScreen: inputTable.upSource.LeftTopSet(posTL)
            }),
            OnUp: function(this) {
                sharedPhoneSounds.appButton.Restart()
                if (inputTable.active == nil || inputTable.active()) {
                    Scene.Change(inputTable.scene)
                }
                else if (inputTable.scene == "PhoneTalk_SC") {
                    sharedPhoneSounds.CantUsePhoneVO.Restart()
                }
                else {
                    sharedPhoneSounds.CantUseThisVO.Restart()
                }
            },
            active: true
        })
        return button;
    }
}