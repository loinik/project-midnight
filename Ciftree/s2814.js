function s2814() {
    var sum = AR.Summary({
        env: "NBH",
        bg: "NBH_NavBBack" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2812",
        onScreen: [0, 0, 1024, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2813",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}