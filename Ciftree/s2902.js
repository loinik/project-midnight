function s2902() {
    var sum = AR.Summary({
        env: "PHG",
        bg: "PHG_Node" + (Flags.Night_FL ? "Night" : "") + "0002_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2651",
        onScreen: [239, 18, 790, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2903",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2901",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2900",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, rightNAV, leftNAV, backNAV];
}