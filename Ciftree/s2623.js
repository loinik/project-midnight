function s2623() {
    var sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Node" + (Flags.Night_FL ? "Night" : "") + "0003_BG"
    });
    var locked = false;
    var fansNAV = AR.Hotspot({
        onScreen: [624, 250, 824, 390],
        scene: "s2625",
        cursor: "MagGlassHot",
        hint: false,
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2620",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2622",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2621",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, fansNAV, rightNAV, leftNAV, backNAV];
}