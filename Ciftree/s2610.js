function s2610() {
    var sum = AR.Summary({
        env: "PHK",
        bg: "PHK_Node" + (Flags.Night_FL ? "Night" : "") + "0000_BG",
        ext: "webp"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2610",
        onScreen: [250, 0, 776, 580],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2611",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2613",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2612",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV, backNAV];
}
