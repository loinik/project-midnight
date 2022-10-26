function s2811() {
    var sum = AR.Summary({
        env: "NBH",
        bg: "NBH_NavA" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2813",
        onScreen: [0, 70, 1024, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2812",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}