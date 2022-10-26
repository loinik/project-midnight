function s2815() {
    var sum = AR.Summary({
        env: "NBH",
        bg: "NBH_NavC" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2817",
        onScreen: [0, 70, 1024, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2816",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}