function s2604() {
    var sum = AR.Summary({
        env: "PHH",
        bg: "PHH_Node" + (Flags.Night_FL ? "Night" : "") + "0002_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2701",
        onScreen: [239, 70, 785, 640],
        cursor: "Forward",
        OnDone: function() {
            closeDoorSFX.Restart()
        },
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2603",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        OnDone: function() {
            closeDoorSFX.Restart()
        },
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2601",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        OnDone: function() {
            closeDoorSFX.Restart()
        },
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2602",
        cursor: "Back",
        OnDone: function() {
            closeDoorSFX.Restart()
        },
        active: function() {
            //return not locked
        }
    });
    var openDoorOVL = AR.Overlay({
        ovl: "PHH_DoorOpen_OVL",
        source: [0, 0, 551, 672],
        onScreen: [239, 18, 790, 690],
        active: true
    });
    //let closeDoorSFX = AR.Sound({
    //    sounds: [
    //        "DecDoorClose1_SFX",
    //        "DecDoorClose2_SFX",
    //        "DecDoorClose3_SFX"
    //    ],
    //    channel: "FX1",
    //    volume: 0.85,
    //    active: false
    //});
    return [sum, forwardNAV, rightNAV, leftNAV, backNAV, openDoorOVL];
}