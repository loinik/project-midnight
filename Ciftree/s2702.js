function s2702() {
    var sum = AR.Summary({
        env: "PHP",
        bg: "PHP_Door" + (Flags.Night_FL ? "Night" : "") + "Open_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2600",
        onScreen: [202, 70, 824, 640],
        cursor: "Forward",
        active: function() {
            closeDoorSFX.play();
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2700",
        cursor: "Back",
        active: function() {
            closeDoorSFX.play();
        }
    });
    let closeDoorSFX = AR.Sound({
        sounds: [
            "DoorClose_Wood01_SFX",
            "DoorClose_Wood02_SFX",
            "DoorClose_Wood03_SFX"
        ],
        id: "closeDoorSFX",
        channel: "FX1",
        volume: 0.75,
        active: false
    });
    return [sum, forwardNAV, backNAV];
}