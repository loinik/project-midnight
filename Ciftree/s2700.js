function s2700() {
    var sum = AR.Summary({
        env: "PHP",
        bg: "PHP_Door" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var houseNAV = AR.Hotspot({
        scene: "s2702",
        onScreen: [202, 0, 824, 640],
        cursor: "Manipulate",
        hint: false,
        active: function() {
            openDoorSFX.play();
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2701",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    let openDoorSFX = AR.Sound({
        sounds: [
            "DoorOpen_Wood01_SFX",
            "DoorOpen_Wood02_SFX",
            "DoorOpen_Wood03_SFX"
        ],
        id: "file",
        channel: "FX1",
        volume: 0.75,
        active: false
    });
    return [sum, houseNAV, backNAV];
}