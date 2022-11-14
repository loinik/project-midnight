function s2629() {
    let sum = AR.Summary({
        env: "PHL",
        bg: "PHL_EasterEgg" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2626",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    return [sum, backNAV];
}