function s2650() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_RoomBath" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var bathroomNAV = AR.Hotspot({
        onScreen: [202, 0, 824, 640],
        cursor: "Manipulate",
        hint: false,
        OnDone: function() {
            //openDoorSFX.play();
            //outTIMER.start();
            //doorOpenOVL.active = true
            
            //locked = true
        },
        active: function() {
            document.querySelector("#doorOpen").style.visibility = "visible";
            outTIMER.start();
            openDoorSFX.play();
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2649",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2651",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    let doorOpen = AR.Movie({
        movie: "PHH_RoomBathOpen" + (Flags.Night_FL ? "Night" : "") + "_BG",
        id: "doorOpen",
        source: Viewport.uiSize,
        onScreen: Viewport.uiSize,
        loop: true,
        z: 4,
        active: false
    });
    let inFADE = MakeVideoFader({
        fade: "in",
        duration: 3,
        OnDone: function() {
            gameScene.style.pointerEvents = "auto";
            Scene.Restart();
            //Flags.LOU_InBathroom_FL = false
        },
        active: function() {
            //return Flags.LOU_InBathroom_FL == true
        },
        z: 8
    });
    let outTIMER = AR.Timer({
        duration: 1,
        OnDone: function() {
            outFADE.Restart();
        },
        active: false
    });
    let outFADE = MakeVideoFader({
        fade: "out",
        duration: 2,
        OnDone: function() {
            NDBathroomVO.play();
        },
        active: false,
        z: 8
    });
    var NDBathroomVO = AR.Sound({
        sounds: [
            "Nancy_Bathroom01_SFX",
            "Nancy_Bathroom02_SFX",
            "Nancy_Bathroom03_SFX",
            "Nancy_Bathroom04_SFX",
            "Nancy_Bathroom05_SFX",
            "Nancy_Bathroom06_SFX",
            "Nancy_Bathroom07_SFX",
            "Nancy_Bathroom08_SFX",
            "Nancy_Bathroom09_SFX",
            "Nancy_Bathroom10_SFX"
        ],
        channel: "PlayerVoice",
        volume: 0.85,
        RunOnce: function() {
            //locked = true
        },
        OnDone: function() {
            //locked = false;
            document.querySelector("#doorOpen").style.visibility = "hidden";
            closeDoorSFX.play();
            inFADE.Restart();
            //Flags.LOU_InBathroom_FL = true
            
            //;
        },
        active: false
    });
    var openDoorSFX = AR.Sound({
        sounds: [
            "DoorOpen_Wood_French01_SFX",
            "DoorOpen_Wood_French02_SFX",
            "DoorOpen_Wood_French03_SFX",
            "DoorOpen_Wood_French04_SFX",
            "DoorOpen_Wood_French05_SFX",
            "DoorOpen_Wood_French06_SFX"
        ],
        channel: "FX1",
        volume: 0.85,
        active: false
    });
    var closeDoorSFX = AR.Sound({
        sounds: [
            "DoorClose_Wood_French01_SFX",
            "DoorClose_Wood_French02_SFX",
            "DoorClose_Wood_French03_SFX",
            "DoorClose_Wood_French04_SFX",
            "DoorClose_Wood_French05_SFX",
            "DoorClose_Wood_French06_SFX"
        ],
        channel: "FX1",
        volume: 0.85,
        active: false
    });
    return [sum, bathroomNAV, doorOpen, rightNAV, leftNAV];
}