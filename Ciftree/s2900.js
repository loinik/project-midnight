function s2900() {
    var sum = AR.Summary({
        env: "PHG",
        bg: "PHG_Node" + (Flags.Night_FL ? "Night" : "") + "0000_BG"
    });
    var locked = false;
    var rightNAV = AR.Hotspot({
        scene: "s2901",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2903",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2902",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV, backNAV];
}
