function s2620() {
    var sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Node" + (Flags.Night_FL ? "Night" : "") + "0000_BG"
    });
    var locked = false;
    var rightNAV = AR.Hotspot({
        scene: "s2621",
        onScreen: [824, 0, 1024, 580],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2623",
        onScreen: [0, 0, 200, 580],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 590, 1024, 690],
        scene: "s2622",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV, backNAV];
}