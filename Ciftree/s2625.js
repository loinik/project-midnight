function s2625() {
    var sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Fans" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2623",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    return [sum, backNAV];
}