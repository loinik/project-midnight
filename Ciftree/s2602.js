function s2602() {
    var sum = AR.Summary({
        env: "PHH",
        bg: "PHH_Node" + (Flags.Night_FL ? "Night" : "") + "0002_BG",
        ext: "webp"
    });
    var locked = false;
    let outdoorNAV = AR.Hotspot({
        scene: "s2604",
        onScreen: [239, 18, 790, 640],
        cursor: "Manipulate",
        hint: false,
        active: function() {
            //return not locked
            openDoorSFX.play();
        }
    });
    let rightNAV = AR.Hotspot({
        scene: "s2603",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    let leftNAV = AR.Hotspot({
        scene: "s2601",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    let backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2600",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    var openDoorSFX = AR.Sound({
        sounds: [
            "DoorOpen_Wood01_SFX",
            "DoorOpen_Wood02_SFX",
            "DoorOpen_Wood03_SFX"
        ],
        channel: "FX1",
        volume: 0.75,
        active: false
    });
    return [sum, outdoorNAV, rightNAV, leftNAV, backNAV];
}