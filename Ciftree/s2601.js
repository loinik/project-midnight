function s2601() {
    var sum = AR.Summary({
        env: "PHH",
        bg: "PHH_Node" + (Flags.Night_FL ? "Night" : "") + "0001_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2620",
        onScreen: [250, 0, 776, 580],
        cursor: "ForwardLeft",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2602",
        onScreen: [824, 0, 1024, 580],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2600",
        onScreen: [0, 0, 200, 580],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 590, 1024, 690],
        scene: "s2603",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, rightNAV, leftNAV, backNAV];
}