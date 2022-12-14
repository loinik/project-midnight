function s2901() {
    var sum = AR.Summary({
        env: "PHG",
        bg: "PHG_Node" + (Flags.Night_FL ? "Night" : "") + "0001_BG",
        ext: "webp"
    });
    var locked = false;
    var rightNAV = AR.Hotspot({
        scene: "s2902",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2900",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2903",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV, backNAV];
}